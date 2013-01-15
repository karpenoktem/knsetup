#!/bin/sh

set -ev

NAME="$1"

echo phassa-$NAME > /etc/debian_chroot
