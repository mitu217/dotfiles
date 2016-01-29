#!/bin/sh
#node.sh

## Homebrewがインストールされているかの確認


## Uninstall

## Install
brew install nodebrew
curl -L git.io/nodebrew | perl - setup
nodebrew install-binary stable
