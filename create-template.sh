#!/bin/sh

set -ev

PROJECTS="/projects"
TEMPLATES="$PROJECTS/templates"

. ./functions.sh

TPLID="`date +%Y%m%d`01"
while [ -d "$TEMPLATES/sankhara-$TPLID" -o -d "$TEMPLATES/phassa-$TPLID" ]; do
	TPLID=$(($TPLID+1))
done

SANKHARA="$TEMPLATES/sankhara-$TPLID"
PHASSA="$TEMPLATES/phassa-$TPLID"

debootstrap squeeze $SANKHARA http://ftp.nl.debian.org/debian
cp /etc/hosts $SANKHARA/etc/hosts
cp /etc/apt/sources.list $SANKHARA/etc/apt/
cp -pr $SANKHARA $PHASSA

echo sankhara-template > $SANKHARA/etc/debian_chroot
echo phassa-template > $PHASSA/etc/debian_chroot

cp -p finish-sankhara-template.sh $SANKHARA/finish-sankhara-template.sh
chmod 544 $SANKHARA/finish-sankhara-template.sh
mount_special_filesystems $SANKHARA
chroot $SANKHARA /finish-sankhara-template.sh
umount_special_filesystems $SANKHARA

cp -p finish-phassa-template.sh $PHASSA/finish-phassa-template.sh
chmod 544 $PHASSA/finish-phassa-template.sh
mount_special_filesystems $PHASSA
chroot $PHASSA /finish-phassa-template.sh
umount_special_filesystems $PHASSA
