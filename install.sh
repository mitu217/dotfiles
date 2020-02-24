#!/bin/bash

set -e

## URLs
GIT_URL="git@github.com:Mitu217/dotfiles.git"
ZIP_URL="https://github.com/Mitu217/dotfiles/archive/master.zip"

## Paths
DOTFILES=".zshrc .zshenv .zshrc.local"
DOTFILE_DIR="${HOME}/dotfiles"

has() {
  type "$1" > /dev/null 2>&1
}

# download dotfiles
if [ ! -d ${DOTFILE_DIR} ]; then
  echo "==> Downloading dotfiles..."
  echo ''
  mkdir ${DOTFILE_DIR} && \
    curl -s -L ${ZIP_URL} --insecure | tar zx -C ${DOTFILE_DIR} --strip-components 1
  echo $(tput setaf 2)Download dotfiles complete!. ✔︎$(tput sgr0)
  echo ''
fi

# deploy dotfiles
cd ${DOTFILE_DIR}
echo '==> Start to deploy dotfiles to home directory'
echo ''
for val in ${DOTFILES}
do
  ln -sfnv ${DOTFILE_DIR}/${val} ${HOME}/${val}
done
echo ''
echo $(tput setaf 2)Deploy dotfiles complete!. ✔︎$(tput sgr0)
echo ''

# initialize
echo '==> Start to initialize'
echo ''
DOTPATH=${DOTFILE_DIR} bash ${DOTFILE_DIR}/etc/init/init.sh
echo ''
echo $(tput setaf 2)initialize complete!. ✔︎$(tput sgr0)
echo ''
