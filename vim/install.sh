#!/bin/bash
# Create symlinks for vim files and do init

# Get absolute path of script
pushd `dirname $0` > /dev/null
DIR=`pwd`
popd > /dev/null

ln -vs $DIR/.vimrc $HOME/.vimrc

mkdir -p ~/.vim/{colors,bundle}
wget https://raw.githubusercontent.com/queyenth/oxeded.vim/master/colors/oxeded.vim -O ~/.vim/colors/oxeded.vim


git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

cd ~/.vim/bundle/YouCompleteMe
python3 install.py --clang-completer --tern-completer

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

