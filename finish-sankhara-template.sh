#!/bin/sh

set -ev

# Don't start MongoDB directly from apt-get install
echo "ENABLE_MONGODB=no" > /etc/default/mongodb

gpg --keyserver subkeys.pgp.net --recv-keys 9ECBEC467F0CEB10
gpg --export --armor 9ECBEC467F0CEB10 | apt-key add -
apt-get update
apt-get install -y git ffmpeg php5-cli php5-mysql php5-memcache php5-curl memcached sudo mongodb-10gen
# mysql-server moet hier ook nog bij maar die crashen de installatie
# postfix en mailman moeten hier ook nog bij, maar die stellen vragen

rm /etc/default/mongodb

addgroup --gid 999 infra
addgroup --gid 1000 kn
addgroup --gid 1001 interinfra
addgroup --gid 501 fotos
adduser --uid 1000 --gid 999 infra --gecos ",,," --disabled-password
adduser --uid 501 --gid 501 fotos --gecos ",,," --disabled-password

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

chown root:infra /knsetup/finish-sankhara-template-infra.sh
chmod 454 /knsetup/finish-sankhara-template-infra.sh

sudo -u infra sh /knsetup/finish-sankhara-template-infra.sh
