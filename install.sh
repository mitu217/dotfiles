#!/bin/bash

set -e

REMOTE_URL="git@github.com:Mitu217/dotfiles.git"
DOT_DIRECTORY="${HOME}/dotfiles"
DOT_TARBALL="https://github.com/Mitu217/dotfiles/tarball/master"
DOTFILES=".zshrc .zshenv .vimrc .vimrc.dein"

has() {
  type "$1" > /dev/null 2>&1
}

# download dotfiles
if [ ! -d ${DOT_DIRECTORY} ]; then
  echo "==> Downloading dotfiles..."
  echo ''
  mkdir ${DOT_DIRECTORY}

  if type "git" > /dev/null 2>&1; then
    git clone --recursive "${REMOTE_URL}" "${DOT_}"
  else
    wget -q ${DOT_TARBALL} -O ${HOME}/dotfiles.tar.gz
    tar -zxf ${HOME}/dotfiles.tar.gz --strip-components 1 -C ${DOT_DIRECTORY}
    rm -f ${HOME}/dotfiles.tar.gz
  fi

  echo $(tput setaf 2)Download dotfiles complete!. ✔︎$(tput sgr0)
  echo ''
fi

cd ${DOT_DIRECTORY}

# deploy dotfiles
echo '==> Start to deploy dotfiles to home directory'
echo ''
for val in ${DOTFILES}
do
  ln -sfnv ${DOT_DIRECTORY}/${val} ${HOME}/${val}
done
echo ''
echo $(tput setaf 2)Deploy dotfiles complete!. ✔︎$(tput sgr0)
echo ''

# initialize
echo '==> Start to initialize'
echo ''
DOTPATH=${DOT_DIRECTORY} bash ${DOT_DIRECTORY}/etc/init/init.sh
echo ''
echo $(tput setaf 2)initialize complete!. ✔︎$(tput sgr0)
echo ''
 
