# 権限のチェック
if (!([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
        [Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "管理者として実行してください"
    exit 1
}

echo "Windowsの開発環境を構築します"
echo ""


############
# 初期設定
############

# 設定されているプロパイダ一覧を取得
echo "[Get PackegeProviders]"
Find-PackageProvider -ForceBootstrap
echo ""

# 実行Policyを変更
echo "[Check ExecutionPolicy]"
Set-ExecutionPolicy RemoteSigned -Force
echo ""

# ChocolateyをPackageProviderへ追加
echo "[AddProvider Chocolatey]"
Get-PackageProvider Chocolatey -ForceBootstrap
echo ""


#########################
# アプリケーションのインストール
# * From Chocolatey
#########################

# git
Find-Package　-ForceBootstrap -Name git -Provider chocolatey
Install-Package -Name git -Force

# Firefox
Find-Package　-ForceBootstrap -Name Firefox -Provider chocolatey
Install-Package -Name Firefox -Force

# chrome
Find-Package　-ForceBootstrap -Name Google-Chrome-x64 -Provider chocolatey
Install-Package -Name Google-Chrome-x64 -Force

# slack
Find-Package　-ForceBootstrap -Name slack -Provider chocolatey
Install-Package -Name slack -Force

# GoogleJapaneseInput
Find-Package　-ForceBootstrap -Name googlejapaneseinput -Provider chocolatey
Install-Package -Name googlejapaneseinput -Force

# 7zip
Find-Package　-ForceBootstrap -Name 7zip -Provider chocolatey
Install-Package -Name 7zip -Force

# Atom
Find-Package　-ForceBootstrap -Name atom -Provider chocolatey
Install-Package -Name atom -Force

# GitKraken
Find-Package　-ForceBootstrap -Name gitkraken -Provider chocolatey
Install-Package -Name gitkraken -Force

# Android Studio
#Find-Package　-ForceBootstrap -Name androidstudio -Provider chocolatey
#Install-Package -Name androidstudio -Force

# virtualbox
Find-Package　-ForceBootstrap -Name virtualbox -Provider chocolatey
Install-Package -Name virtualbox -Force

# vagrant
Find-Package　-ForceBootstrap -Name vagrant -Provider chocolatey
Install-Package -Name vagrant -Force

# Tweeten


#########################
# アプリケーションのインストール
# * From Git
#########################

# wsltty
git clone https://github.com/mintty/wsltty.git wsltty
cd wsltty
./install.bat
cd ..
Remove-Item -Force .\wsltty\ -recurse


#############################
# dotfileのシンボリックリンクを作成
# * bashから参照するため
# * 文字コードの変更がどこかから必要くさい
#############################
New-Item "c:\dotfiles" -type directory 
echo "source /mnt/c/Users/$env:USERNAME/dotfiles/.zshrc" > c:\dotfiles\zshrc
echo "source /mnt/c/Users/$env:USERNAME/dotfiles/.vimrc" > c:\dotfiles\vimrc
echo "source /mnt/c/Users/$env:USERNAME/dotfiles/.tmux.conf" > c:\dotfiles\tmux.conf
