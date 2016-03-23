#!/bin/bash
# Create symlinks for isync IMAP sync client

# Get absolute path of script
pushd `dirname $0` > /dev/null
DIR=`pwd`
popd > /dev/null

gpg2 --try-secret-key 0E25CFCC -d --verbose -o $DIR/mbsyncrc < $DIR/mbsyncrc.gpg
ln -vs $DIR/mbsyncrc $HOME/.mbsyncrc

