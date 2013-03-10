#!/bin/sh

set -ev

if [ -z "$1" ]; then
	echo "Usage: $0 <name>" >&2
	exit 1
fi

NAME="$1"
TEMPLATE=/root/dbtemplate

if [ ! -d "$TEMPLATE" ]; then
	echo "$0: DB-template not found" >&2
	exit 1
fi

cd $TEMPLATE
sed -i 's/return/#&/g' /home/infra/repo/utils/anonymized-dump/restore.py
python /home/infra/repo/utils/anonymized-dump/restore.py

(
	. /root/configuration.sh
	echo "CREATE USER prj_${NAME}_fotos@localhost IDENTIFIED BY '$PASSWORD_KNFOTOS';"
	echo "CREATE DATABASE prj_${NAME}_fotos;"
	echo "GRANT ALL PRIVILEGES ON prj_${NAME}_fotos.* TO prj_${NAME}_fotos@localhost;"
) | mysql
mysql prj_${NAME}_fotos < fotos.sql
