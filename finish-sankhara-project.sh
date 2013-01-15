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

sed "s/%PORTNR%/$(($RANDOM%65536+32768))/g" < /knsetup/mongodb.conf > /etc/mongodb.conf

# Setup config.php for knfotos
sed -e 's@/path/to/fotos/@/var/fotos/@g' -e 's@/path/to/cache/@/var/cache/fotos/@g' -e "s@db_user.*@db_user = 'prj_$NAME_fotos';@g" -e "s@db_db.*@db_db = 'prj_$NAME_fotos';@g" -e "s@karpenoktem.nl@$HTTP_DOMAIN@g" -e 's@/fotos2/@/fotos/@g' -e "s@db_pass.*@db_pass = '$PASSWORD_KNFOTOS';@g" -e "s@mongo_db.*@mongo_db = 'prj_$NAME';@g" < /srv/karpenoktem.nl/htdocs/fotos/config.php.sample > /srv/karpenoktem.nl/htdocs/fotos/config.php
chown fotos:www-data /srv/karpenoktem.nl/htdocs/fotos/config.php
chmod 640 /srv/karpenoktem.nl/htdocs/fotos/config.php
