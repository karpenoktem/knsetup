#!/bin/sh

set -ev

apt-get update
apt-get install -y sudo python python-django msgpack-python screen

addgroup --gid 1000 kn

mkdir /var/run/infra
mkdir /root/kninfra
mkdir /root/scm
mkdir /root/scm/mirte
mkdir /root/scm/sarah
mkdir /root/py
cd /root/py
ln -s ../scm/mirte/src mirte
ln -s ../scm/sarah/src sarah
