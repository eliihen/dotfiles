#!/bin/bash
# Symlink the files in the root directory and recursively
# call all install.sh scripts in subfolders

# Get absolute path of script
pushd `dirname $0` > /dev/null
DIR=`pwd`
popd > /dev/null

for script in $(find "$DIR" -mindepth 2 -name 'install.sh'); do
  echo -n "Would you like to install $(dirname $script) (y/n)? "
  read answer
  if echo "$answer" | grep -iq "^y" ;then
    echo running "$script"
    $script
  fi
done

ln -vs $DIR/.Xresources $HOME/.Xresources
ln -vs $DIR/.xinitrc $HOME/.xinitrc

xrdb $HOME/.Xresources

echo Done!

