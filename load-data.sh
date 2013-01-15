#!/bin/sh

set -ev
PROJECTS="/projects"
TEMPLATES="$PROJECTS/templates"

if [ -z "$1" -o -z "$2" ]; then
	echo "Usage: $0 <name> <dbtemplate>" >&2
	exit 1
fi

NAME="$1"
DBTPL="$2"

if [ ! -d "$TEMPLATES/db-$DBTPL" ]; then
	echo "$0: DB-template is unknown" >&2
	exit 1
fi

cd $TEMPLATES/db-$DBTPL
sed -i 's/return/#&/g' /home/infra/repo/utils/anonymized-dump/restore.py
python /home/infra/repo/utils/anonymized-dump/restore.py

(
	. /root/configuration.sh
	echo "CREATE USER prj_${NAME}_fotos@localhost IDENTIFIED BY '$PASSWORD_KNFOTOS';"
	echo "CREATE DATABASE prj_${NAME}_fotos;"
	echo "GRANT ALL PRIVILEGES ON prj_${NAME}_fotos.* TO prj_${NAME}_fotos@localhost;"
) | mysql
mysql prj_$NAME_fotos < fotos.sql
