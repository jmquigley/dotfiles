#!/usr/bin/env bash

#
# Used as the entry point for the development docker container.  The
# container is built as part of docker compose.  It will automatically
# build the Dockerfile in the project and save it as a dev container.
#
# This script will set the default locale, copy in development ssh keys
# set the root password, and start the SSH daemon.
#

cat <<- EOF > /etc/profile.d/devenv.sh
export LANG="en_US.utf8"
export LANGUAGE="en_US.utf8"
export LC_ALL="en_US.utf8"
EOF

cp -r /run/secrets/root_ssh_key /root/.ssh/id_rsa
cp -r /run/secrets/root_ssh_pub_key /root/.ssh/id_rsa.pub
cp -r /run/secrets/root_ssh_pub_key /root/.ssh/authorized_keys
chmod -R 700 /root/.ssh

echo "root:$(cat /run/secrets/root_password)" | chpasswd
chsh -s /usr/bin/zsh root

# Applies the dotfile startup files to environment
pushd /workspace
if [[ ! -d /workspace/dotfiles ]]; then
    git clone git@github.com:jmquigley/dotfiles.git
    pushd dotfiles
    ./setup.sh
    popd
else
    pushd dotfiles
    git pull
    ./setup.sh
    popd
fi
popd

/usr/sbin/sshd -D
