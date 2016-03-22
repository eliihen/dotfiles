#!/bin/bash
# Create symlinks for kharl CardDAV client

# Get absolute path of script
pushd `dirname $0` > /dev/null
DIR=`pwd`
popd > /dev/null

function install_to {
  local folder=$1

  if [ ! -d "$folder" ]; then
    mkdir -v "$folder"
  fi

  ln -vs $DIR/khard.conf $folder/khard.conf
}

# Check if ~/.config exists
if [ -d "$HOME/.config" ]; then
  install_to "$HOME/.config/khard"
else
  install_to "$HOME/.khard"
fi

