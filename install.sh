#!/bin/bash

set -e

DOT_DIRECTORY="${HOME}/dotfiles"
DOT_TARBALL="https://github.com/Mitu217/dotfiles/tarball/master"
REMOTE_URL="git@github.com:Mitu217/dotfiles.git"

has() {
  type "$1" > /dev/null 2>&1
}

if [ ! -d ${DOT_DIRECTORY} ]; then
  echo "Downloading dotfiles..."
  mkdir ${DOT_DIRECTORY}

  if type "git" > /dev/null 2>&1; then
    git clone --recursive "${REMOTE_URL}" "${DOT_DIRECTORY}"
  else
    curl -fsSLo ${HOME}/dotfiles.tar.gz ${DOT_TARBALL}
    tar -zxf ${HOME}/dotfiles.tar.gz --strip-components 1 -C ${DOT_DIRECTORY}
    rm -f ${HOME}/dotfiles.tar.gz
  fi

  echo $(tput setaf 2)Download dotfiles complete!. ✔︎$(tput sgr0)
fi

cd ${DOT_DIRECTORY}
make install
