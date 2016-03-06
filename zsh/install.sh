#!/bin/bash
# Symlink zshrc to home folder

# Get absolute path of script
pushd `dirname $0` > /dev/null
DIR=`pwd`
popd > /dev/null

ln -vs $DIR/.zshrc $HOME/.zshrc

