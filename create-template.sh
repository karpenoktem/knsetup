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
mkdir $SANKHARA/knsetup
cp -pr ./ $SANKHARA/knsetup
find $SANKHARA/knsetup -type f -exec chmod g-w {} +
cp -pr $SANKHARA $PHASSA

echo sankhara-template > $SANKHARA/etc/debian_chroot
echo phassa-template > $PHASSA/etc/debian_chroot

chmod 544 $SANKHARA/knsetup/finish-sankhara-template.sh
mount_special_filesystems $SANKHARA
chroot $SANKHARA /knsetup/finish-sankhara-template.sh
umount_special_filesystems $SANKHARA

chmod 544 $PHASSA/knsetup/finish-phassa-template.sh
mount_special_filesystems $PHASSA
chroot $PHASSA /knsetup/finish-phassa-template.sh
umount_special_filesystems $PHASSA
