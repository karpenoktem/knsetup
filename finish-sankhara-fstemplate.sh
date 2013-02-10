#!/bin/sh

set -ev

install -m 0555 /knsetup/set-git-credentials /usr/local/bin/

# Don't start MongoDB directly from apt-get install
echo "ENABLE_MONGODB=no" > /etc/default/mongodb

# Preseed some packages to stop them from asking questions
cat <<EOF | debconf-set-selections
mailman	mailman/gate_news	boolean	false
mailman	mailman/site_languages	multiselect	en
mailman	mailman/queue_files_present	select	abort installation
mailman	mailman/used_languages	string	
mailman	mailman/default_server_language	select	en
mailman	mailman/create_site_list	note	
EOF

gpg --keyserver subkeys.pgp.net --recv-keys 9ECBEC467F0CEB10
gpg --export --armor 9ECBEC467F0CEB10 | apt-key add -
apt-get update
apt-get install -y equivs
(
	cd /knsetup
	equivs-build fake-mta.equivs
	equivs-build fake-httpd.equivs
	dpkg -i *.deb
)

apt-get install -y git ffmpeg php5-cli php5-mysql php5-memcache php5-curl memcached sudo python python-django python-m2crypto python-mysqldb python-gdata msgpack-python python-pymongo msgpack-python mailman python-bson python-pyparsing python-imaging python-markdown
apt-get install -y --no-install-recommends ipython
# mongodb-10gen gebruiken we voorlopig nog algemeen op khandhas
# mysql-server moet hier ook nog bij maar die crashen de installatie (en gebruiken we voorlopig nog algemeen op khandhas)
# postfix moet hier ook nog bij, maar die stelt vragen

rm /etc/default/mongodb

addgroup --gid 999 infra
addgroup --gid 1000 kn
addgroup --gid 1001 interinfra
addgroup --gid 501 fotos
adduser --uid 1000 --gid 999 infra --gecos ",,," --disabled-password
adduser --uid 501 --gid 501 fotos --gecos ",,," --disabled-password

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

mkdir -p /var/fotos
mkdir -p /var/cache/fotos
chown fotos:fotos /var/fotos /var/cache/fotos

chown root:infra /knsetup/finish-sankhara-fstemplate-infra.sh
chmod 454 /knsetup/finish-sankhara-fstemplate-infra.sh

sudo -u infra sh /knsetup/finish-sankhara-fstemplate-infra.sh
