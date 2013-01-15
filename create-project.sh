#!/bin/sh

set -ev

. ./functions.sh

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

cat <<EOF > $PROJECTS/$NAME/boot.sh
#!/bin/sh

set -ev

unionfs-fuse -o cow,max_files=32768 -o allow_other,use_ino,suid,dev,nonempty $PROJECTS/$NAME/sankhara-union=RW:$TEMPLATES/sankhara-$FSTPL=RO $PROJECTS/$NAME/sankhara
unionfs-fuse -o cow,max_files=32768 -o allow_other,use_ino,suid,dev,nonempty $PROJECTS/$NAME/phassa-union=RW:$TEMPLATES/phassa-$FSTPL=RO $PROJECTS/$NAME/phassa

mount_special_filesystems $PROJECTS/$NAME/sankhara
mount_special_filesystems $PROJECTS/$NAME/phassa

mount --bind $PROJECTS/$NAME/sankhara/home/infra/repo $PROJECTS/$NAME/phassa/root/kninfra
mount --bind $PROJECTS/$NAME/sankhara/home/infra/scm/sarah $PROJECTS/$NAME/phassa/root/scm/sarah
mount --bind $PROJECTS/$NAME/sankhara/home/infra/scm/mirte $PROJECTS/$NAME/phassa/root/scm/mirte
EOF
chmod +x $PROJECTS/$NAME/boot.sh
sh $PROJECTS/$NAME/boot.sh

cp finish-sankhara-project.sh $PROJECTS/$NAME/sankhara
cp finish-phassa-project.sh $PROJECTS/$NAME/phassa
chmod 544 $PROJECTS/$NAME/sankhara/finish-sankhara-project.sh $PROJECTS/$NAME/phassa/finish-sankhara-project.sh
chroot $PROJECTS/$NAME/sankhara /finish-sankhara-project.sh $NAME
chroot $PROJECTS/$NAME/phassa /finish-phassa-project.sh $NAME
