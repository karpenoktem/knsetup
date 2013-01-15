#!/bin/sh

set -ev

NAME="$1"

echo $NAME > /etc/debian_chroot
