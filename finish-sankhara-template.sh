#!/bin/sh

set -ev

gpg --recv-keys 9ECBEC467F0CEB10 --keyserver subkeys.pgp.net
gpg --export --armor 9ECBEC467F0CEB10 | apt-key add -
apt-get update
apt-get install -y git

addgroup --gid 999 infra
addgroup --gid 1000 kn
addgroup --gid 1001 interinfra
addgroup --gid 501 fotos
adduser --uid 1000 --gid 999 infra --gecos ",,," --disabled-password
adduser --uid 501 --gid 501 fotos --gecos ",,," --disabled-password
