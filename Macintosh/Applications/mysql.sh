#!/bin/sh
#mysql.sh

## Homebrewがインストールされているかの確認

## Uninstall

## Install
brew install mysql
brew link --force mysql
mysql.server start
ln -sfv $(brew --prefix mysql)/*.plist ~/Library/LaunchAgents/
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist

## Checking Install Process
