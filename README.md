# dotfiles

macOS向けの開発環境設定を管理するdotfilesリポジトリです。[chezmoi](https://www.chezmoi.io/)を使用して設定ファイルを管理しています。

## 主な構成

| カテゴリ | ツール |
|---------|--------|
| Shell | Zsh |
| Terminal | VS Code |
| Editor | VS Code |
| Package Manager | Homebrew |
| SSH / 署名 | 1Password SSH Agent |

## セットアップ

### Stage 1: 基本セットアップ

```bash
curl -fsSL 'https://raw.githubusercontent.com/mitu217/dotfiles/master/install.sh' | bash
```

以下が自動的に実行されます:

1. Homebrew インストール
2. chezmoi インストール
3. `chezmoi init --apply` で dotfiles を適用
   - **name**, **email** を入力
   - 全パッケージインストール（1Password 含む）
   - macOS デフォルト設定

### Stage 2: 1Password セットアップ（手動）

SSH 認証と git コミット署名は 1Password SSH Agent 経由で行います。1Password にログインした後で設定します。

1. **1Password** を開いてログイン
2. **Settings > Developer** で **SSH Agent** を有効化し、`~/.ssh/config` への `IdentityAgent` 追加を許可
3. **GitHub** ([Settings > SSH and GPG keys](https://github.com/settings/keys)) に鍵を登録:
   - SSH 認証用の鍵 → **Authentication Key**
   - 署名用の鍵 → **Signing Key**
4. `~/.gitconfig.local` を作成（`signingkey` は 1Password の署名用の鍵の公開鍵）:

```ini
[user]
    signingkey = ssh-ed25519 AAAA...

[gpg]
    format = ssh

[gpg "ssh"]
    program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign"

[commit]
    gpgsign = true

[tag]
    gpgsign = true

[url "ssh://git@github.com/"]
    insteadOf = https://github.com/
```

確認:

```bash
ssh -T git@github.com                    # SSH 接続テスト
git commit --allow-empty -m "test"       # 署名テスト
```

### Stage 3: 手動設定

1. 再起動（修飾キーとキーボードショートカットの反映）
2. **System Settings > ディスプレイ** で以下をオフ:
   - **輝度を自動調整**
   - **True Tone**
3. **System Settings > キーボード** で以下をオフ:
   - **キーボードの輝度**（スライダーを一番左に）
   - **環境光が暗い場合にキーボードの輝度を調整**

## リポジトリ構造

```
.
├── dot_zshrc                # Zsh設定
├── dot_Brewfile             # Homebrewパッケージ定義
├── dot_gitconfig.tmpl       # Git設定（~/.gitconfig.local を読み込む）
├── run_once_*.sh.tmpl       # 初回セットアップスクリプト
│   └── 60_macos-defaults    # macOSデフォルト設定
├── run_onchange_*.sh.tmpl   # 変更時実行スクリプト
│   └── 20_brew-bundle       # Brewfileからパッケージインストール
└── private_dot_claude/      # Claude Code設定（プライベート）
```

## 仕組み

`chezmoi apply` を実行すると：

1. 設定ファイル（`dot_*`）がホームディレクトリに配置される
2. `run_once_*` スクリプトが初回のみ実行される
3. `run_onchange_*` スクリプトは対象ファイルが変更されたときに再実行される

テンプレート（`.tmpl`）は chezmoi のデータで展開されます。name と email は `chezmoi init` 時に入力します。

## ライセンス

MIT
