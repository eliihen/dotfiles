#!/bin/bash
# Create symlinks for mutt, the email client

# Get absolute path of script
pushd `dirname $0` > /dev/null
DIR=`pwd`
popd > /dev/null

# Install mutt files
mkdir -v $HOME/.mutt/
mkdir -v $HOME/.mutt/temp
mkdir -v $HOME/.mutt/scripts
ln   -vs $DIR/muttrc       $HOME/.muttrc
ln   -vs $DIR/mailcap      $HOME/.mutt/mailcap
ln   -vs $DIR/colors.theme $HOME/.mutt/theme
ln   -vs $DIR/config       $HOME/.vdirsyncer/config
touch $HOME/.mutt/signature


echo Installing mutt related scripts
if [ ! -d $HOME/.vdirsyncer ]; then
  mkdir -v $HOME/.vdirsyncer
fi
ln -vs $DIR/scripts/getPass.sh   $HOME/.vdirsyncer/getPass.sh
ln -vs $DIR/scripts/checkmail.sh $HOME/.mutt/checkmail.sh

