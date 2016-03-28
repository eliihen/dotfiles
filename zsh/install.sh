#!/bin/bash
# Symlink zshrc to home folder

# Get absolute path of script
pushd `dirname $0` > /dev/null
DIR=`pwd`
popd > /dev/null

# Install OMZ
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

rm $HOME/.zshrc
ln -vs $DIR/.zshrc $HOME/.zshrc

