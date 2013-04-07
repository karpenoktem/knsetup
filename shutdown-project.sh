#!/bin/sh

set -v

if [ -z "$1" ]; then
	echo "Usage: $0 <name>" >&2
	exit 1
fi

PROJECTS="/projects"
NAME="$1"

LSOF_PHASSA="lsof -F p $PROJECTS/$NAME/phassa"
LSOF_SANKHARA="lsof -F p $PROJECTS/$NAME/sankhara"

X=1
while [ "$X" -lt 15 ]; do
	PIDS="`$LSOF_PHASSA | sed 's/^p//g'`"
	if [ -z "$PIDS" ]; then
		LSOF_PHASSA=":"
	else
		kill $PIDS
	fi
	PIDS="`$LSOF_SANKHARA | sed 's/^p//g'`"
	if [ -z "$PIDS" ]; then
		LSOF_SANKHARA=":"
	else
		kill $PIDS
	fi
	if [ "$LSOF_PHASSA" = ":" -a "$LSOF_SANKHARA" = ":" ]; then
		break
	fi
	X=$(($X+1))
	sleep 1
done

PIDS="`$LSOF_PHASSA | sed 's/^p//g'`"
if [ -n "$PIDS" ]; then
	kill -9 $PIDS
fi
PIDS="`$LSOF_SANKHARA | sed 's/^p//g'`"
if [ -n "$PIDS" ]; then
	kill -9 $PIDS
fi

sh $PROJECTS/$NAME/umount.sh
