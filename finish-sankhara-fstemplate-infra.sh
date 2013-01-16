#!/bin/sh

set -ev

cd ~infra

git clone git://github.com/karpenoktem/kninfra.git repo
ln -s repo/bin

(
	mkdir scm
	cd scm
	git clone git://github.com/bwesterb/mirte
	git clone git://github.com/bwesterb/py-tarjan
	git clone git://github.com/karpenoktem/regl
	git clone git://github.com/bwesterb/sarah
)

(
	mkdir py
	cd py
	git clone git://github.com/awesterb/koert
	for i in mirte sarah; do
		ln -s ../scm/$i/src $i
	done
	ln -s ../scm/py-tarjan/src tarjan
	ln -s ../scm/regl
	mkdir iso8601
	cd /tmp
	tar xf iso8601-0.1.4.tar.gz
	mv iso8601-0.1.4/iso8601/*.py /home/infra/py/iso8601
)

(
	mkdir media
	cd media
	for i in base leden reglementen; do
		ln -s ../repo/kn/$i/media $i
	done
)
