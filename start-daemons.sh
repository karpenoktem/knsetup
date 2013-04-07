#!/bin/sh

set -ev

if [ -z "$1" ]; then
	echo "Usage: $0 <name>" >&2
	exit 1
fi

unset STY

case "$1" in
	--start-sankhara)
		export PYTHONPATH=/home/infra/py
		/home/infra/bin/run-fcgi
		service lighttpd start
		cd /home/infra/repo/utils/
		screen -d -m -S daan python daan.py
		su -c "screen -d -m -S infra python giedo.py" infra
		su -c "screen -X chdir /home/infra/repo/kn/" infra
		# su -c "screen -X screen python manage.py runserver 0:8004" infra
		return
	;;
	--start-phassa)
		export PYTHONPATH=/root/py
		cd /root/kninfra/utils/
		screen -d -m -S cilia python cilia.py
		return
	;;
esac

NAME="$1"
PROJECTS=/projects

chroot $PROJECTS/$NAME/phassa /knsetup/start-daemons.sh --start-phassa
chroot $PROJECTS/$NAME/sankhara /knsetup/start-daemons.sh --start-sankhara
