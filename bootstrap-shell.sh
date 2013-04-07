#!/bin/sh

if [ -z "$1" ]; then
	echo "Usage: $0 <knuser>" >&2
	exit 1
fi
export PROJECT_USER="$1"
shift
if [ -d /home/infra/py ]; then
	export PYTHONPATH=/home/infra/py
elif [ -d /root/py ]; then
	export PYTHONPATH=/root/py
fi
if [ -n "$1" ]; then
	exec "$@"
fi
exec $SHELL -i
