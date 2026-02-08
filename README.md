# dotfiles

macOS向けの開発環境設定を管理するdotfilesリポジトリです。[chezmoi](https://www.chezmoi.io/)を使用して設定ファイルを管理しています。

## 主な構成

| カテゴリ | ツール |
|---------|--------|
| Shell | Zsh |
| Terminal | iTerm2 |
| Editor | Vim (dein.vim) |
| Multiplexer | tmux |
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
   - Vim プラグインセットアップ
   - `~/.1password/agent.sock` シンボリックリンク作成

この時点では git は HTTPS で動作します（1Password 未設定のため SSH 署名は無効）。

### Stage 2: 1Password セットアップ + SSH 有効化

1. **1Password** を開いてログイン
2. **Settings > Developer** で以下を有効化:
   - **SSH Agent**
   - **Integrate with 1Password CLI**
3. **GitHub** ([Settings > SSH and GPG keys](https://github.com/settings/keys)) に鍵を登録:
   - SSH 認証用の鍵 → **Authentication Key**
   - 署名用の鍵 → **Signing Key**
4. chezmoi を再適用:

```bash
chezmoi apply       # op CLI で署名鍵を自動取得し、SSH 署名 + URL リライトが有効化
```

確認:

```bash
ssh -T git@github.com                    # SSH 接続テスト
git commit --allow-empty -m "test"       # 署名テスト
git log --show-signature -1              # 署名確認
```

これで git が SSH 経由になり、コミットが自動的に署名されます。

## リポジトリ構造

```
.
├── dot_zshrc                # Zsh設定
├── dot_zshenv               # Zsh環境変数
├── dot_Brewfile             # Homebrewパッケージ定義
├── dot_gitconfig.tmpl       # Git設定（SSH署名・URL リライト）
├── dot_tmux.conf            # tmux設定
├── dot_vimrc                # Vim設定
├── dot_vimrc.dein           # dein.vimプラグイン設定
├── private_dot_ssh/         # SSH設定（1Password agent）
│   └── config
├── run_once_*.sh.tmpl       # 初回セットアップスクリプト
│   ├── 10_install-homebrew  # Homebrewインストール
│   ├── 30_setup-1password   # 1Password SSH agentセットアップ
│   ├── 50_setup-vim         # dein.vimセットアップ
│   └── 60_macos-defaults    # macOSデフォルト設定
├── run_onchange_*.sh.tmpl   # 変更時実行スクリプト
│   └── 20_brew-bundle       # Brewfileからパッケージインストール
├── private_dot_claude/      # Claude Code設定（プライベート）
├── .github/workflows/       # GitHub Actions CI
└── CLAUDE.md                # Claude Code向けプロジェクト設定
```

## 仕組み

`chezmoi apply` を実行すると：

1. 設定ファイル（`dot_*`）がホームディレクトリに配置される
2. `run_once_*` スクリプトが初回のみ実行される
3. `run_onchange_*` スクリプトは対象ファイルが変更されたときに再実行される

テンプレート（`.tmpl`）は chezmoi のデータで展開されます。name と email は `chezmoi init` 時に入力し、signingkey は `op` CLI（1Password）から自動取得されます。1Password 未設定時は signingkey が空になり、gitconfig の SSH 署名と URL リライトは無効になります。

## ライセンス

MIT
