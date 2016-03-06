#!/bin/bash
# Create symlinks for i3 wm files

# Get absolute path of script
pushd `dirname $0` > /dev/null
DIR=`pwd`
popd > /dev/null

function install_to {
  local folder=$1

  if [ ! -d "$folder" ]; then
    mkdir -v "$folder"
  fi

  ln -vs $DIR/config $folder/config
  ln -vs $DIR/i3blocks "$folder"blocks

  # git submodule update --init "$DIR/i3blocks/i3blocks-contrib"
}

# Check if ~/.config exists
if [ -d "$HOME/.config" ]; then
  install_to "$HOME/.config/i3"
else
  install_to "$HOME/.i3"
fi

