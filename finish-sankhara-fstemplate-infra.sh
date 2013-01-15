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
	for i in mirte py-tarjan regl sarah; do
		ln -s ../scm/$i
	done
	# XXX iso8601 ophalen
)

(
	mkdir media
	cd media
	for i in base leden reglementen; do
		ln -s ../repo/kn/$i/media $i
	done
)
