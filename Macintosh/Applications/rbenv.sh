#!/bin/sh
#rbenv.sh

## Homebrewがインストールされているかの確認

## Install
brew install ruby-build
brew install rbenv

## rbenvの初期化スクリプトを.zshrcに登録
#echo 'eval "$(rbenv init -)"' >> ~/.zshrc

## rbenvでrubyをインストールした際に自動再読み込みしてくれるプラグインのインストール
git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

## 正しくインストールできているかの確認

