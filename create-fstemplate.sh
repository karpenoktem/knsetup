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

cdebootstrap squeeze $SANKHARA http://ftp.nl.debian.org/debian
cp /etc/hosts $SANKHARA/etc/hosts
cp /etc/apt/sources.list $SANKHARA/etc/apt/
mkdir $SANKHARA/knsetup
cp -pr ./ $SANKHARA/knsetup
find $SANKHARA/knsetup -type f -exec chmod g-w {} +
cp -pr $SANKHARA $PHASSA

echo sankhara-template > $SANKHARA/etc/debian_chroot
echo phassa-template > $PHASSA/etc/debian_chroot

chmod 544 $SANKHARA/knsetup/finish-sankhara-fstemplate.sh
mount_special_filesystems $SANKHARA
chroot $SANKHARA /knsetup/finish-sankhara-fstemplate.sh
umount_special_filesystems $SANKHARA

chmod 544 $PHASSA/knsetup/finish-phassa-fstemplate.sh
mount_special_filesystems $PHASSA
chroot $PHASSA /knsetup/finish-phassa-fstemplate.sh
umount_special_filesystems $PHASSA

rm -f $TEMPLATES/sankhara-latest
rm -f $TEMPLATES/phassa-latest
ln -s $TEMPLATES/sankhara-latest sankhara-$TPLID
ln -s $TEMPLATES/phassa-latest phassa-$TPLID

echo "Created fstemplate $TPLID"
