#!/bin/sh

set -ev

NAME="$1"

. ./functions.sh

echo $NAME > /etc/debian_chroot

cat <<EOF > /finish-sankhara-project-infra.sh
#!/bin/sh

set -ev

. ./functions.sh

prepare_git_repo /home/infra/repo
prepare_git_repo /home/infra/scm/mirte
prepare_git_repo /home/infra/scm/py-tarjan
prepare_git_repo /home/infra/scm/regl
prepare_git_repo /home/infra/scm/sarah
prepare_git_repo /home/infra/py/koert
EOF

sudo -u infra sh /finish-sankhara-project-infra.sh

prepare_git_repo /srv/karpenoktem.nl/htdocs/forum
prepare_git_repo /srv/karpenoktem.nl/htdocs/fotos
prepare_git_repo /srv/karpenoktem.nl/htdocs/mediawiki
prepare_git_repo /srv/karpenoktem.nl/htdocs/site
