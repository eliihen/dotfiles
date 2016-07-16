#!/bin/bash
# Set up plugins et cetera

mkdir -vp ~/.vim/bundle

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

cd ~/.vim/bundle/YouCompleteMe
python3 install.py --clang-completer --tern-completer --racer-completer

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

