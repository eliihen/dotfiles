#!/bin/bash
# Create symlinks for isync IMAP sync client

# Get absolute path of script
pushd `dirname $0` > /dev/null
DIR=`pwd`
popd > /dev/null

gpg2 --try-secret-key 0E25CFCC -d --verbose -o $DIR/config < $DIR/config.gpg
if [ ! -d $HOME/.vdirsyncer ]; then
  mkdir -v $HOME/.vdirsyncer
fi
ln   -vs $DIR/config $HOME/.vdirsyncer/config

mkdir -v $HOME/.calendars/
echo ---------------------------------------------------------------
echo Remember to create subfolders for calendars in $HOME/.calendars
echo ---------------------------------------------------------------

mkdir -v $HOME/.contacts/

