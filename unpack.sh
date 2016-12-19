#!/bin/bash

# use this script to unpack all dotfiles to proper places in an environment
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PluginInstall +qall
cp .vimrc ~/
