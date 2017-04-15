#!/bin/bash

# --------------------
# Ubuntu Setup Scripts
# Author: Mitu217
# Update: 2017/03/20
# --------------------

# Copy dotfiles
if [ -e ~/.zshrc ]; then
  rm ~/.zshrc
fi
echo 'source ~/dotfiles/.zshrc' > ~/.zshrc
source ~/.zshrc
zsh

if [ -e ~/.tmux.conf ]; then
  rm ~/.tmux.conf
fi
echo 'source ~/dotfiles/.tmux.conf' > ~/.tmux.conf

if [ -e ~/.vimrc ]; then
  rm ~/.vimrc
fi
echo 'source ~/dotfiles/.vimrc' > ~/.vimrc


# Add PPA
sudo add-apt-repository ppa:webupd8team/atom

# Update Apt-get
sudo apt-get update

# Install Middlewares
sudo apt-get install -y git
sudo apt-get install -y vim
sudo apt-get install -y tmux
sudo apt-get install -y zsh
sudo apt-get install -y Virtualbox
sudo apt-get install -y Vagrant
sudo apt-get install -y atom
suod apt-get install -y guake

# ---------------
# Setting Options
# ---------------

# Neobundle
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
sh ./install.sh
rm install.sh

# Nodebrew
wget git.io/nodebrew
perl nodebrew setup
nodebrew install latest
rm nodebrew

# Change DirectoryName
LANG=C xdg-user-dirs-gtk-update

# plank
sudo add-apt-repository ppa:ricotz/docky 
sudo apt-get update 
sudo apt-get install plank
