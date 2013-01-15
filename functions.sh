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
