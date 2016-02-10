#!/bin/sh -eu

## copy dotfiles
if [ -e ~/.zshrc ]; then
  rm ~/.zshrc
fi
ln -s $(cd $(dirname $0);pwd)/dotfiles/.zshrc ~/.zshrc

if [ -e ~/.tmux.conf ]; then
  rm ~/.tmux.conf
fi
ln -s $(cd $(dirname $0);pwd)/dotfiles/.tmux.conf ~/.tmux.conf

if [ -e ~/.vimrc ]; then
  rm ~/.vimrc
fi
ln -s $(cd $(dirname $0);pwd)/dotfiles/.vimrc ~/.vimrc


## Install Homebrew & cask
if type brew > /dev/null 2>&1; then
 	echo ""
	echo "Homebrew is already installed."
	echo "Updating Homebrew..."
	echo ""

	brew prune
	brew cleanup
	brew doctor
	brew update
else
	echo ""
 	echo "Installing Homebrew..."
 	echo ""

 	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew tap caskroom/homebrew-versions
	brew doctor
	brew update
	brew install caskroom/cask/brew-cask
fi


#export HOMEBREW_CASK_OPTS="--appdir=/Applications"

## Install Softwares
brew install curl
brew install git
brew install openssl
brew install readline
brew install tmux
brew install tree
brew install wget


## Install Applications
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

brew cask install alfred
brew cask install android-studio
brew cask install appcleaner
brew cask install iterm2
brew cask install java
brew cask install refresh-finder
brew cask install shiftit
brew cask install sublime-text3
brew cask install the-unarchiver
brew cask install vagrant
brew cask install virtualbox
brew cask install xquartz


## Change Login Shell
brew install zsh
chsh -s /bin/zsh


## Setup Vim
brew install vim --with-lua

rm -rf ~/.vim/bundle/neobundle.vim
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim


## Setup Ruby eails
brew install rbenv
brew install ruby-build

rm -rf ~/.rbenv/plugins/ruby-build
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build


## Setup Node.js & electron
brew install nodebrew
nodebrew selfupdate

## Update
brew upgrade



