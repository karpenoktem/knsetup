#!/bin/bash

if ! type declare >/dev/null; then
	echo "$0: This should be run with bash instead of sh" >&2
	exit 1
fi

set -ev

. ./functions.sh

if [ -z "$1" -o -z "$2" -o -z "$3" ]; then
	echo "Usage: $0 <name> <fs-template> <db-template>" >&2
	exit 1
fi

PROJECTS="/projects"
TEMPLATES="$PROJECTS/templates"
NAME="$1"
FSTPL="$2"
DBTPL="$3"

if [ -d "$PROJECTS/$NAME" ]; then
	echo "$0: Name already in use" >&2
	exit 1
fi
if [ ! -d "$TEMPLATES/sankhara-$FSTPL" -o ! -d "$TEMPLATES/phassa-$FSTPL" ]; then
	echo "$0: FS-template is unknown" >&2
	exit 1
fi
if [ ! -d "$TEMPLATES/db-$DBTPL" ]; then
	echo "$0: DB-template is unknown" >&2
	exit 1
fi

PORT_BASE=$((`(
	echo 13000
	grep '^PORT_BASE' $PROJECTS/*/sankhara/root/configuration.sh | sed 's/.*=//g'
) | sort | tail -1`+10))

mkdir $PROJECTS/$NAME
mkdir $PROJECTS/$NAME/sankhara
mkdir $PROJECTS/$NAME/phassa
mkdir $PROJECTS/$NAME/sankhara-union
mkdir $PROJECTS/$NAME/phassa-union

cat <<EOF > $PROJECTS/$NAME/boot.sh
#!/bin/sh

set -ev

`declare -f mount_special_filesystems`

unionfs-fuse -o cow,max_files=32768 -o allow_other,use_ino,suid,dev,nonempty $PROJECTS/$NAME/sankhara-union=RW:$TEMPLATES/sankhara-$FSTPL=RO $PROJECTS/$NAME/sankhara
unionfs-fuse -o cow,max_files=32768 -o allow_other,use_ino,suid,dev,nonempty $PROJECTS/$NAME/phassa-union=RW:$TEMPLATES/phassa-$FSTPL=RO $PROJECTS/$NAME/phassa

mount_special_filesystems $PROJECTS/$NAME/sankhara
mount_special_filesystems $PROJECTS/$NAME/phassa

mount --bind $PROJECTS/$NAME/sankhara/var/run/infra $PROJECTS/$NAME/phassa/var/run/infra
mount --bind $PROJECTS/$NAME/sankhara/home/infra/repo $PROJECTS/$NAME/phassa/root/kninfra
mount --bind $PROJECTS/$NAME/sankhara/home/infra/scm/sarah $PROJECTS/$NAME/phassa/root/scm/sarah
mount --bind $PROJECTS/$NAME/sankhara/home/infra/scm/mirte $PROJECTS/$NAME/phassa/root/scm/mirte

# XXX /var/{cache/,}fotos nfs-mounten
EOF
chmod +x $PROJECTS/$NAME/boot.sh
sh $PROJECTS/$NAME/boot.sh

cat <<EOF > $PROJECTS/$NAME/umount.sh
#!/bin/sh

set -v

`declare -f umount_special_filesystems`

umount_special_filesystems $PROJECTS/$NAME/sankhara
umount_special_filesystems $PROJECTS/$NAME/phassa

umount $PROJECTS/$NAME/phassa/var/run/infra
umount $PROJECTS/$NAME/phassa/root/kninfra
umount $PROJECTS/$NAME/phassa/root/scm/sarah
umount $PROJECTS/$NAME/phassa/root/scm/mirte

umount $PROJECTS/$NAME/sankhara
umount $PROJECTS/$NAME/phassa
EOF
chmod +x $PROJECTS/$NAME/umount.sh

cat <<EOF > $PROJECTS/$NAME/sankhara/root/configuration.sh
HTTP_DOMAIN=$NAME.test.karpenoktem.nl
PASSWORD_SECRET_KEY='`pwgen -s1 60`'
PASSWORD_MAILMAN_LISTDEFAULT='`pwgen -s1`'
PASSWORD_WIKI='`pwgen -s1`'
PASSWORD_KNFOTOS='`pwgen -s1`'
PASSWORD_FORUM='`pwgen -s1`'
PASSWORD_CHUCK_NORRIS='`pwgen -s1`'
PORT_BASE=$PORT_BASE
PORT_LIGHTTPD=$(($PORT_BASE+0))
PORT_MONGODB=$(($PORT_BASE+1))
PORT_MYSQLD=$(($PORT_BASE+2))
EOF

cp -pr $TEMPLATES/db-$DBTPL/ $PROJECTS/$NAME/sankhara/root/dbtemplate

chmod 544 $PROJECTS/$NAME/sankhara/knsetup/finish-sankhara-project.sh $PROJECTS/$NAME/phassa/knsetup/finish-phassa-project.sh
chroot $PROJECTS/$NAME/sankhara /knsetup/finish-sankhara-project.sh $NAME
chroot $PROJECTS/$NAME/phassa /knsetup/finish-phassa-project.sh $NAME

sh ./generate-lighttpd-proxying.sh
# Don't forget to reload the lighttpd config

sh start-daemons.sh $NAME
