#!/bin/sh

##########################################################
##  Bootstrap script for system provisioning	##
##	Alex Wilson <a.wilson@alumni.warwick.ac.uk>	##
##########################################################

SALT_CONFIG_URL=https://api.github.com/repos/mrwilson/salt-config/tarball
SALT_CONFIG_DIR=/srv/salt

DOTFILES_URL=https://api.github.com/repos/mrwilson/dotfiles/tarball
DOTFILES_DIR=/srv/salt-files

echo "Downloading minimal salt-minion"
wget -O - http://bootstrap.saltstack.org | sh

echo "Downloading salt-config from GitHub"
mkdir $SALT_CONFIG_DIR
wget -qO- $SALT_CONFIG_URL | tar zxvf - -C $SALT_CONFIG_DIR --strip 1

echo "Downloading dotfiles"
mkdir $DOTFILES_DIR
wget -qO- $DOTFILES_URL | tar zxvf - -C $DOTFILES_DIR --strip 1

echo "Copying salt-minion config"
cp $SALT_CONFIG_DIR/salt-minion.cfg /etc/salt/minion

echo "Starting salt build"
salt-call state.highstate

echo "Reassigning privileges"
chown -R mrwilson:mrwilson $SALT_CONFIG_DIR
chown -R mrwilson:mrwilson $DOTFILES_DIR
