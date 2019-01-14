#!/bin/sh
#vim.sh

brew install vim --with-lua

mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
