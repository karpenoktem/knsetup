#!/bin/sh

set -ev

apt-get update
apt-get install -y sudo

mkdir /var/run/infra
mkdir /root/kninfra
mkdir /root/scm
mkdir /root/scm/mirte
mkdir /root/scm/sarah
mkdir /root/py
cd /root/py
ln -s ../scm/mirte
ln -s ../scm/sarah
