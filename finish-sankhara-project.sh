#!/bin/bash

set -ev

NAME="$1"

prepare_git_repo () {
	(
		cd "$1"
		if [ ! -f .git/config ]; then
			echo "$0: prepare_git_repo: `pwd` is not a git repo" >&2
			exit 1
		fi
		git checkout -f
		git pull
		git checkout -b prj-$NAME
	)
}

echo sankhara-$NAME > /etc/debian_chroot

cat <<EOF > /knsetup/finish-sankhara-project-infra.sh
#!/bin/sh

set -ev

NAME="$NAME"

`declare -f prepare_git_repo`

prepare_git_repo /home/infra/repo
prepare_git_repo /home/infra/scm/mirte
prepare_git_repo /home/infra/scm/py-tarjan
prepare_git_repo /home/infra/scm/regl
prepare_git_repo /home/infra/scm/sarah
prepare_git_repo /home/infra/py/koert
EOF

sudo -u infra sh /knsetup/finish-sankhara-project-infra.sh

prepare_git_repo /srv/karpenoktem.nl/htdocs/forum
prepare_git_repo /srv/karpenoktem.nl/htdocs/fotos
prepare_git_repo /srv/karpenoktem.nl/htdocs/mediawiki
prepare_git_repo /srv/karpenoktem.nl/htdocs/site

. /root/configuration.sh

sed "s/%PORTNR%/$PORT_MONGODB/g" < /knsetup/mongodb.conf > /etc/mongodb.conf
sed "s/%PROJECT_NAME%/$NAME/g" < /knsetup/mm_cfg.py > /etc/mailman/mm_cfg.py
sed -i -e "s/%PORTNR%/$PORT_LIGHTTPD/g" -e "s/%PROJECT_NAME%/$NAME/g" /etc/lighttpd/lighttpd.conf
sed -i "s/3306/$PORT_MYSQLD/g" /etc/mysql/my.cnf
sed -i "s/%PROJECT_NAME%/$NAME/g" /etc/lighttpd/rewrites.conf

service mysql start

ln -s karpenoktem.nl /srv/$HTTP_DOMAIN

# Setup config.php for knfotos
sed -e 's@/path/to/fotos/@/var/fotos/@g' \
    -e 's@/path/to/cache/@/var/cache/fotos/@g' \
		-e "s@db_user.*@db_user = 'prj_${NAME}_fotos';@g" \
		-e "s@db_db.*@db_db = 'prj_${NAME}_fotos';@g" \
		-e "s@karpenoktem.nl@$HTTP_DOMAIN@g" \
		-e 's@/fotos2/@/fotos/@g' \
		-e "s@db_pass.*@db_pass = '$PASSWORD_KNFOTOS';@g" \
		-e "s@mongo_db.*@mongo_db = 'prj_$NAME';@g" \
		< /srv/karpenoktem.nl/htdocs/fotos/config.php.sample > /srv/karpenoktem.nl/htdocs/fotos/config.php
chown fotos:www-data /srv/karpenoktem.nl/htdocs/fotos/config.php
chmod 640 /srv/karpenoktem.nl/htdocs/fotos/config.php

# Setup settings.py for kninfra
sed -e "s/karpenoktem.nl/$HTTP_DOMAIN/g" \
    -e "s@^INFRA_UID.*@INFRA_UID = 1000@g" \
    -e "s@^MONGO_DB.*@MONGO_DB = 'prj_$NAME'@g" \
    -e "s@^SECRET_KEY.*@SECRET_KEY = '$PASSWORD_SECRET_KEY'@g" \
    -e "s@^MAILMAN_DEFAULT_PASSWORD.*@MAILMAN_DEFAULT_PASSWORD = '$PASSWORD_MAILMAN_LISTDEFAULT'@g" \
    -e "s@^WIKI_MYSQL_SECRET.*@WIKI_MYSQL_SECRET = ('localhost', 'prj_${NAME}_wiki', '$PASSWORD_WIKI', 'prj_${NAME}_wiki')@g" \
    -e "s@^FORUM_MYSQL_SECRET.*@FORUM_MYSQL_SECRET = ('localhost', 'prj_${NAME}_punbb', '$PASSWORD_FORUM', 'prj_${NAME}_punbb')@g" \
    -e "s@^PHOTOS_MYSQL_SECRET.*@PHOTOS_MYSQL_SECRET = ('localhost', 'prj_${NAME}_fotos', '$PASSWORD_KNFOTOS', 'prj_${NAME}_fotos')@g" \
    -e "s@^CHUCK_NORRIS_HIS_SECRET.*@CHUCK_NORRIS_HIS_SECRET = '$PASSWORD_CHUCK_NORRIS'@g" \
    -e "s@^ALLOWED_API_KEYS.*@ALLOWED_API_KEYS = ()@g" \
		 < /home/infra/repo/kn/settings.example.py > /home/infra/repo/kn/settings.py
chown infra:infra /home/infra/repo/kn/settings.py
chmod 600 /home/infra/repo/kn/settings.py

cat <<EOF > /srv/karpenoktem.nl/htdocs/site/config.php
<?php
	\$cfg['curi'] = '$HTTP_DOMAIN/';
	\$cfg['auri'] = '$HTTP_DOMAIN/';

	\$cfg['forum']['user'] = 'prj_${NAME}_punbb';
	\$cfg['forum']['password'] = '$PASSWORD_FORUM';
	\$cfg['forum']['db'] = 'prj_${NAME}_punbb';
	\$cfg['forum']['topicUri'] = 'http://$HTTP_DOMAIN/forum/viewtopic.php?id=';
?>
EOF
chown www-data:interinfra /srv/karpenoktem.nl/htdocs/site/config.php
chmod 600 /srv/karpenoktem.nl/htdocs/site/config.php

cat <<EOF > /srv/karpenoktem.nl/htdocs/site/config.agenda.php
<?php
	// To be generated
	\$cfg['agenda'] = array();
?>
EOF
chown infra /srv/karpenoktem.nl/htdocs/site/config.agenda.php

(
	cd /srv/karpenoktem.nl/htdocs/site/
	./utils/install > config.release.php
)

cat <<EOF > /srv/karpenoktem.nl/htdocs/forum/config.php
<?php
$db_type = 'mysqli';
$db_host = 'localhost';
$db_name = 'prj_${NAME}_punbb';
$db_username = 'prj_{$NAME}_punbb';
$db_password = '$PASSWORD_FORUM';
$db_prefix = '';
$p_connect = false;

$base_url = 'http://$HTTP_DOMAIN/forum';

$cookie_name = 'forum_cookie_`pwgen -1s 6`';
$cookie_domain = '';
$cookie_path = '/';
$cookie_secure = 0;

define('FORUM', 1);
define('FORUM_DEBUG', 1);
?>
EOF
chown www-data:www-data /srv/karpenoktem.nl/htdocs/forum/config.php
chmod 400 /srv/karpenoktem.nl/htdocs/forum/config.php

cat <<EOF | mysql --defaults-file=/etc/mysql/debian.cnf
CREATE USER prj_${NAME}_wiki@localhost IDENTIFIED BY '$PASSWORD_WIKI';
CREATE DATABASE prj_${NAME}_wiki;
GRANT ALL PRIVILEGES ON prj_${NAME}_wiki.* TO prj_${NAME}_wiki@localhost;
EOF

cd /srv/karpenoktem.nl/htdocs/mediawiki/maintenance
php install.php --confpath /tmp --dbname "prj_${NAME}_wiki" --dbuser "prj_${NAME}_wiki" --dbpass "$PASSWORD_WIKI" --pass "$PASSWORD_WIKI_ADMIN" --server "http://$HTTP_DOMAIN" KnWiki Admin

sed -e "s/%HTTP_DOMAIN%/$HTTP_DOMAIN/g" \
    -e "s/%MYSQL_DB%/prj_${NAME}_wiki/g" \
    -e "s/%MYSQL_USER%/prj_${NAME}_wiki/g" \
    -e "s/%MYSQL_PASSWORD%/$PASSWORD_WIKI/g" \
    -e "s/%PROXY_KEY%/$PASSWORD_WIKI_PROXY_KEY/g" \
         < /knsetup/mediawiki-LocalSettings.php > /srv/karpenoktem.nl/htdocs/mediawiki/LocalSettings.php
chown www-data:infra /srv/karpenoktem.nl/htdocs/mediawiki/LocalSettings.php
chmod 600 /srv/karpenoktem.nl/htdocs/mediawiki/LocalSettings.php

export PYTHONPATH=/home/infra/py
sh /knsetup/load-data.sh $NAME || true
