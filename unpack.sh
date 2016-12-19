#!/bin/bash

# use this script to unpack all dotfiles to proper places in an environment
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
cp .vimrc ~/
