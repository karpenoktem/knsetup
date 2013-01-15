#!/bin/sh

mount_special_filesystems() {
	mount -t proc proc $1/proc
	mount -t sysfs sysfs $1/sys
	mount -t devpts devpts $1/dev/pts
}

umount_special_filesystems() {
	umount $1/proc
	umount $1/sys
	umount $1/dev/pts
}

prepare_git_repo () {
	(
		cd "$1"
		if [ ! -d .git/config ]; then
			echo "$0: prepare_git_repo: `pwd` is not a git repo" >&2
			exit 1
		fi
		git checkout -f
		git pull
		git checkout -b $NAME
	)
}
