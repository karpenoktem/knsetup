#!/bin/sh

set -ev

PROJECTS="/projects"
TEMPLATES="$PROJECTS/templates"

. ./functions.sh

TPLID="`date +%Y%m%d`01"
while [ -d "$TEMPLATES/db-$TPLID" ]; do
	TPLID=$(($TPLID+1))
done

mkdir $TEMPLATES/db-$TPLID
cd $TEMPLATES/db-$TPLID
python /home/infra/repo/utils/anonymized-dump/create.py

mysqldump fotos > fotos.sql
# mysqldump punbb > punbb.sql # XXX strip all personal data
# mysqldump wiki > wiki.sql # XXX strip all personal data

echo "Created dbtemplate $TPLID"
