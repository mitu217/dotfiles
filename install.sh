#!/bin/bash

set -e

REMOTE_URL="git@github.com:Mitu217/dotfiles.git"
DOTFILES_DIRECTORY="${HOME}/dotfiles"
DOTFILES_TARBALL="https://github.com/Mitu217/dotfiles/tarball/master"
DOTFILES=".zshrc .zshenv .vimrc .vimrc.dein"

has() {
  type "$1" > /dev/null 2>&1
}

# download dotfiles
if [ ! -d ${DOTFILES_DIRECTORY} ]; then
  echo "==> Downloading dotfiles..."
  echo ''
  mkdir ${DOTFILES_DIRECTORY}

  if type "git" > /dev/null 2>&1; then
    git clone --recursive "${REMOTE_URL}" "${DOTFILES_DIRECTORY}"
  else
    wget -q ${DOTFILES_TARBALL} -O ${HOME}/dotfiles.tar.gz
    tar -zxf ${HOME}/dotfiles.tar.gz --strip-components 1 -C ${DOTFILES_DIRECTORY}
    rm -f ${HOME}/dotfiles.tar.gz
  fi

  echo $(tput setaf 2)Download dotfiles complete!. ✔︎$(tput sgr0)
  echo ''
fi

cd ${DOTFILES_DIRECTORY}

# deploy dotfiles
echo '==> Start to deploy dotfiles to home directory'
echo ''
for val in ${DOTFILES}
do
  ln -sfnv ${DOTFILES_DIRECTORY}/${val} ${HOME}/${val}
done
echo ''
echo $(tput setaf 2)Deploy dotfiles complete!. ✔︎$(tput sgr0)
echo ''
