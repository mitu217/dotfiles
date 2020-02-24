#!/bin/bash

# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu

# Load vital library that is most important and
# constructed with many minimal functions
. "$DOTPATH"/etc/lib/vital.sh

chflags nohidden ~/Library          # ~/Library ディレクトリを見えるようにする
sudo chflags nohidden /Volumes      # /Volumes ディレクトリを見えるようにする
sudo nvram SystemAudioVolume=" "    # ブート時のサウンドを無効化する

defaults write -g NSAutomaticWindowAnimationsEnabled -bool false      # ファイルを開くときのアニメーションを無効にする
defaults write -g NSInitialToolTipDelay -integer 0                    # ツールチップ表示までのタイムラグをなくす
defaults write -g NSWindowResizeTime 0.1                              # ダイアログ表示やウィンドウリサイズ速度を高速化する


defaults write NSGlobalDomain AppleShowAllExtensions -bool true       # 全ての拡張子のファイルを表示する
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"    # スクロールバーを常時表示する
defaults write NSGlobalDomain com.apple.springing.delay -float 0      # スプリングロード遅延を除去する
defaults write NSGlobalDomain com.apple.springing.enabled -bool true  # ディレクトリのスプリングロードを有効にする
defaults write NSGlobalDomain KeyRepeat -int 2                        # キーリピートの速度
defaults write NSGlobalDomain InitialKeyRepeat -int 15                # キーリピート開始までのタイミング
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001         # コンソールアプリケーションの画面サイズ変更を高速にする

defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40    # Bluetooth ヘッドフォン・ヘッドセットの音質を向上させる

defaults write com.apple.CrashReporter DialogType -string "none"      # クラッシュレポートを無効化する

defaults write com.apple.dashboard mcx-disabled -bool true            # Dashboard を無効化する

defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true    # USB やネットワークストレージに .DS_Store ファイルを作成しない
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

defaults write com.apple.dock autohide-delay -float 0                 # Dock が表示されるまでの待ち時間を無効にする
defaults write com.apple.dock mcx-expose-disabled -bool false         # Mission Control を使用可能にする

defaults write com.apple.finder AppleShowAllFiles YES                         # 不可視ファイルを表示する
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"           # 検索時にデフォルトでカレントディレクトリを検索する
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false    # 拡張子変更時の警告を無効化する

defaults write com.apple.LaunchServices LSQuarantine -bool false      # 未確認のアプリケーションを実行する際のダイアログを無効にする

defaults write com.apple.screencapture disable-shadow -bool true      # スクリーンキャプチャの影をなくす
defaults write com.apple.screencapture type -string "png"             # スクリーンショットの保存形式を PNG にする

defaults write com.apple.terminal StringEncodings -array 4            # UTF-8 のみを使用する

log_pass "default: successfully"
