#!/bin/sh -eu

####################
# install function
####################
setup_macintosh () {
  ## Homebrew & cask
  if type brew > /dev/null 2>&1; then
    echo "Homebrew is already installed."
    echo "Updating Homebrew..."
    brew prune
    brew cleanup
    brew doctor
    brew update
  else
    echo "Installing Homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew tap caskroom/homebrew-versions
    brew doctor
    brew update
  fi
  
  ## Install
  brew install curl
  brew install git
  brew install openssl
  brew install readline
  brew install tmux
  brew install tree
  brew install wget
  brew install zsh
  brew install vim --with-lua
  brew install rbenv
  brew install ruby-build
  brew install nodebrew
  brew install phpbrew
  brew install doxygen
  brew install go

  ## cask-install
  brew cask install alfred
  brew cask install android-studio
  brew cask install appcleaner
  brew cask install expandrive
  brew cask install google-japanese-ime
  brew cask install shiftit
  brew cask install the-unarchiver
  brew cask install vagrant
  brew cask install virtualbox
  brew cask install xquartz

  ## Change Login Shell
  chsh -s /bin/zsh

  ## Neobundle
  rm -rf ~/.vim/bundle/neobundle.vim
  mkdir -p ~/.vim/bundle
  git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
  
  exit

  ## Setup Ruby eails
  rm -rf ~/.rbenv/plugins/ruby-build
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

  ## Setup Node.js & electron
  nodebrew selfupdate
  
  ## Setup PHP
  phpbrew init
}


####################
# Checking Option
####################

fflag=""

while (( $# > 0 ))
do
  case "$1" in
    -*)
      if [[ "$1" =~ 'f' ]]; then
        fflag="-f"
      fi
      shift
      ;;
    +)
      ((++argc))
      argv=("${argv[@]}" "$1")
      shift
      ;;
  esac
done


######################
# Placement dotfiles
######################
if [ -e ~/.zshrc ]; then
  rm ~/.zshrc
fi
echo 'source ~/dotfiles/.zshrc' > ~/.zshrc
if [ -e ~/.tmux.conf ]; then
  rm ~/.tmux.conf
fi
echo 'source ~/dotfiles/.tmux.conf' > ~/.tmux.conf
if [ -e ~/.vimrc ]; then
  rm ~/.vimrc
fi
echo 'source ~/dotfiles/.vimrc' > ~/.vimrc


##################
# Install Action
##################
if [ `uname` = "Darwin" ]; then
  echo "Start Initializing for Machintosh"
  setup_macintosh
  if [ "$fflag" = "-f" ]; then
    setup_macintosh_expand
  fi
elif [ `uname` = "Linux" ]; then
  ## Check what distribution
  if [ -e /etc/debian_version ] ||
     [ -e /etc/debian_release ]; then
    ## Check Ubuntu or Debian
    if [ -e /etc/lsb-release ]; then
      ## Ubuntu
      distri_name="ubuntu"
    else
      ## Debian
      distri_name="debian"
    fi
  elif [ -e /etc/fedora-release ]; then
    # Fedra
    distri_name="fedora"
  elif [ -e /etc/redhat-release ]; then
    # CentOS
    distri_name="redhat"
  elif [ -e /etc/turbolinux-release ]; then
    # Turbolinux
    distri_name="turbol"
  elif [ -e /etc/SuSE-release ]; then
    # SuSE Linux
    distri_name="suse"
  elif [ -e /etc/mandriva-release ]; then
    # Mandriva Linux
    distri_name="mandriva"
  elif [ -e /etc/vine-release ]; then
    # Vine Linux
    distri_name="vine"
  elif [ -e /etc/gentoo-release ]; then
    # Gentoo Linux
    distri_name="gentoo"
  else
    # Other
    echo "unkown distribution"
    distri_name="unkown"
  fi
fi
