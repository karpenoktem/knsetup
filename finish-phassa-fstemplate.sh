#!/bin/sh

set -ev

install -m 0555 /knsetup/groupadd /usr/sbin/

cat <<EOF | debconf-set-selections
samba-common    samba-common/workgroup  string  KARPENOKTEM
EOF

apt-get update
apt-get install -y sudo python python-django msgpack-python screen samba

addgroup --gid 1000 kn

mkdir /groups
mkdir /var/run/infra
mkdir /root/kninfra
mkdir /root/scm
mkdir /root/scm/mirte
mkdir /root/scm/sarah
mkdir /root/py
cd /root/py
ln -s ../scm/mirte/src mirte
ln -s ../scm/sarah/src sarah
