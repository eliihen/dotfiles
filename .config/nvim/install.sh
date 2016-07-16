#!/bin/bash
# Set up plugins et cetera

# Ensure plugins work with nvim
pip install --user --upgrade neovim

# Download vim plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Do magic
nvim +PlugInstall +qall

