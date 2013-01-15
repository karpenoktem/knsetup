#!/bin/sh -ev

source functions.sh

cd /projects/templates/

TPLID='`date +%Y%m%d`01"
while [ -d "$TPLID" ]; do
	TPLID=$(($TPLID+1))
done

SANKHARA="sankhara-$TPLID"
PHASSA="phassa-$TPLID"

debootstrap squeeze $SANKHARA http://ftp.nl.debian.org/debian
cp /etc/hosts $SANKHARA/etc/hosts
cp /etc/apt/sources.list $SANKHARA/etc/apt/
cp -pr $SANKHARA $PHASSA

echo sankhara-template > $SANKHARA/etc/debian_chroot
echo phassa-template > $PHASSA/etc/debian_chroot

cp -p finish-sankhara-template.sh $SANKHARA/finish-sankhara-template.sh
mount_special_filesystems $SANKHARA
chroot $SANKHARA /finish-sankhara-template.sh
umount_special_filesystems $SANKHARA

cp -p finish-phassa-template.sh $SANKHARA/finish-phassa-template.sh
mount_special_filesystems $PHASSA
chroot $PHASSA /finish-phassa-template.sh
umount_special_filesystems $PHASSA
