#!/bin/sh

set -ev

apt-get update

mkdir /root/kninfra
mkdir /root/scm
mkdir /root/scm/mirte
mkdir /root/scm/sara
mkdir /root/py
cd /root/py
ln -s ../scm/mirte
ln -s ../scm/sarah
