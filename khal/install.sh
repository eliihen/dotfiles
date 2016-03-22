#!/bin/bash
# Create symlinks for khal CalDAV client

# Get absolute path of script
pushd `dirname $0` > /dev/null
DIR=`pwd`
popd > /dev/null

function install_to {
  local folder=$1

  if [ ! -d "$folder" ]; then
    mkdir -v "$folder"
  fi

  ln -vs $DIR/khal.conf $folder/khal.conf
}

# Check if ~/.config exists
if [ -d "$HOME/.config" ]; then
  install_to "$HOME/.config/khal"
else
  install_to "$HOME/.khal"
fi

