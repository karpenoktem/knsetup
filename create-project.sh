#!/bin/sh -ev

source functions.sh

if [ -z "$1" ]; then
	echo "Usage: $0 <name> <fs-template>" >&2
	exit 1
fi

PROJECTS="/projects"
TEMPLATES="$PROJECTS/templates"
NAME="$1"
FSTPL="$2"

if [ -d "$PROJECTS/$NAME" ]; then
	echo "$0: Name already in use" >&2
	exit 1
fi
if [ ! -d "$TEMPLATES/sankhara-$FSTPL" -o ! -d "$TEMPLATES/phassa-$FSTPL" ]; then
	echo "$0: FS-template is unknown" >&2
	exit 1
fi

mkdir $PROJECTS/$NAME
mkdir $PROJECTS/$NAME/sankhara
mkdir $PROJECTS/$NAME/phassa
mkdir $PROJECTS/$NAME/sankhara-union
mkdir $PROJECTS/$NAME/phassa-union
unionfs-fuse -o cow,max_files=32768 -o allow_other,use_ino,suid,dev,nonempty $PROJECTS/$NAME/sankhara-union=RW:$TEMPLATES/sankhara-$FSTPL=RO $PROJECTS/$NAME/sankhara
unionfs-fuse -o cow,max_files=32768 -o allow_other,use_ino,suid,dev,nonempty $PROJECTS/$NAME/phassa-union=RW:$TEMPLATES/phassa-$FSTPL=RO $PROJECTS/$NAME/phassa
cp -p finish-sankhara-project.sh $PROJECTS/$NAME/sankhara
cp -p finish-phassa-project.sh $PROJECTS/$NAME/phassa
mount_special_filesystems $PROJECTS/$NAME/sankhara
mount_special_filesystems $PROJECTS/$NAME/phassa
chroot $PROJECTS/$NAME/sankhara /finish-sankhara-project.sh $NAME
chroot $PROJECTS/$NAME/phassa /finish-phassa-project.sh $NAME
