#!/bin/sh

set -ev

install -m 0555 /knsetup/set-git-credentials /usr/local/bin/

# Don't start MongoDB etc directly from apt-get install
cat <<EOF > /usr/sbin/policy-rc.d
#!/bin/sh

exit 101
EOF
chmod 555 /usr/sbin/policy-rc.d

gpg --keyserver subkeys.pgp.net --recv-keys 9ECBEC467F0CEB10
gpg --export --armor 9ECBEC467F0CEB10 | apt-key add -
apt-get update

apt-get install -y equivs pwgen
(
	cd /knsetup
	equivs-build fake-mta.equivs
	equivs-build fake-httpd.equivs
	dpkg -i *.deb
)

# Preseed some packages to stop them from asking questions
MYSQL_ROOT_PASSWORD=`pwgen -s1 32`
cat <<EOF | debconf-set-selections
mailman	mailman/gate_news	boolean	false
mailman	mailman/site_languages	multiselect	en
mailman	mailman/queue_files_present	select	abort installation
mailman	mailman/used_languages	string	
mailman	mailman/default_server_language	select	en
mailman	mailman/create_site_list	note	
postfix	postfix/root_address	string	
postfix	postfix/rfc1035_violation	boolean	false
postfix	postfix/retry_upgrade_warning	boolean	
postfix	postfix/kernel_version_warning	boolean	
postfix	postfix/mydomain_warning	boolean	
postfix	postfix/mynetworks	string	127.0.0.0/8 [::ffff:127.0.0.0]/104 [::1]/128
postfix	postfix/not_configured	error	
postfix	postfix/relayhost	string	10.0.0.1
postfix	postfix/mailbox_limit	string	0
postfix	postfix/procmail	boolean	false
postfix	postfix/bad_recipient_delimiter	error	
postfix	postfix/protocols	select	ipv4
postfix	postfix/mailname	string	PROJECT_NAME.test.karpenoktem.nl
postfix	postfix/tlsmgr_upgrade_warning	boolean	
postfix	postfix/recipient_delim	string	+
postfix	postfix/main_mailer_type	select	Internet with smarthost
postfix	postfix/destinations	string	PROJECT_NAME.test.karpenoktem.nl, localhost.localdomain, localhost
postfix	postfix/chattr	boolean	false
mysql-server-5.1	mysql-server/root_password_again	password	$MYSQL_ROOT_PASSWORD
mysql-server-5.1	mysql-server/root_password	password	$MYSQL_ROOT_PASSWORD
mysql-server-5.1	mysql-server/error_setting_password	error	
mysql-server-5.1	mysql-server-5.1/nis_warning	note	
mysql-server-5.1	mysql-server-5.1/really_downgrade	boolean	false
mysql-server-5.1	mysql-server-5.1/start_on_boot	boolean	true
mysql-server-5.1	mysql-server-5.1/postrm_remove_databases	booleanfalse
mysql-server-5.1	mysql-server/password_mismatch	error	
mysql-server-5.1	mysql-server/no_upgrade_when_using_ndb	error	
EOF

apt-get install -y git ffmpeg php5-cli php5-cgi php5-mysql php5-memcache php5-curl php5-intl memcached sudo python python-django python-m2crypto python-mysqldb python-gdata msgpack-python python-pymongo msgpack-python mailman python-pyparsing python-imaging python-markdown python-pip build-essential python-dev mysql-client screen nvi lighttpd python-flup php-pear postfix mysql-server
apt-get install -y --no-install-recommends ipython
# mongodb-10gen gebruiken we voorlopig nog algemeen op khandhas

pip install pymongo
pecl install mongo

rm /usr/sbin/policy-rc.d

rm -rf /etc/lighttpd
cp -pr /knsetup/lighttpd-config/ /etc/lighttpd/

for i in /knsetup/profiles/*; do
	cp $i /etc/bashrc-`basename $i`
done
cat <<EOF >> /etc/bash.bashrc

if [ -n "\$PROJECT_USER" -a -f "/etc/bashrc-\$PROJECT_USER" ]; then
	. "/etc/bashrc-\$PROJECT_USER"
fi
EOF

addgroup --gid 999 infra
addgroup --gid 1000 kn
addgroup --gid 1001 interinfra
addgroup --gid 501 fotos
adduser --uid 1000 --gid 999 infra --gecos ",,," --disabled-password
adduser --uid 501 --gid 501 fotos --gecos ",,," --disabled-password
gpasswd -a infra list
gpasswd -a infra interinfra
gpasswd -a www-data interinfra
gpasswd -a fotos interinfra

mkdir -p /var/run/infra
chown infra:interinfra /var/run/infra
chmod 775 /var/run/infra

mkdir -p /srv/karpenoktem.nl/htdocs/
cd /srv/karpenoktem.nl/htdocs/
ln -s /mnt/phassa/groups/leden/site-archief archief
wget -O favicon.ico http://karpenoktem.nl/favicon.ico
git clone git://github.com/karpenoktem/punbb.git forum
git clone git://github.com/karpenoktem/knfotos.git fotos
git clone git://github.com/karpenoktem/mediawiki.git mediawiki
git clone git://github.com/karpenoktem/knsite site
ln -s karpenoktem.nl /srv/default

chown www-data /srv/karpenoktem.nl/htdocs/forum/cache
chown www-data /srv/karpenoktem.nl/htdocs/forum/img/avatars

mkdir -p /var/fotos
mkdir -p /var/cache/fotos
chown fotos:fotos /var/fotos /var/cache/fotos

chown root:infra /knsetup/finish-sankhara-fstemplate-infra.sh
chmod 454 /knsetup/finish-sankhara-fstemplate-infra.sh

sudo -u infra sh /knsetup/finish-sankhara-fstemplate-infra.sh

/var/lib/mailman/bin/check_perms -f
