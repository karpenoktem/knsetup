#!/bin/sh

if [ -z "$1" ]; then
	echo "Usage: $0 <knuser>" >&2
	exit 1
fi
export PROJECT_USER="$1"
exec $SHELL -i
