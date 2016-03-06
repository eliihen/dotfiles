#!/bin/bash
# Symlink the files in the root directory and recursively
# call all install.sh scripts in subfolders

# Get absolute path of script
pushd `dirname $0` > /dev/null
DIR=`pwd`
popd > /dev/null

for script in $(find "$DIR" -mindepth 2 -name 'install.sh'); do
  echo running "$script"
  $script
done

ln -vs $DIR/.Xresources $HOME/.Xresources
ln -vs $DIR/.xinitrc $HOME/.xinitrc

xrdb $HOME/.Xresources

echo Done!

