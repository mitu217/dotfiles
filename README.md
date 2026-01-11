# dotfiles

macOS向けの開発環境設定を管理するdotfilesリポジトリです。[chezmoi](https://www.chezmoi.io/)を使用して設定ファイルを管理しています。

## 主な構成

| カテゴリ | ツール |
|---------|--------|
| Shell | Zsh |
| Terminal | Ghostty |
| Editor | Vim (dein.vim) |
| Multiplexer | tmux |
| Package Manager | Homebrew |

## インストール

### ワンライナー

```bash
curl -fsSL 'https://raw.githubusercontent.com/Mitu217/dotfiles/master/install.sh' | bash
```

### chezmoiを使用（既にインストール済みの場合）

```bash
chezmoi init --apply Mitu217
```

## リポジトリ構造

```
.
├── dot_zshrc                # Zsh設定
├── dot_zshenv               # Zsh環境変数
├── dot_Brewfile             # Homebrewパッケージ定義
├── dot_config/              # ~/.config/ 配下の設定
│   └── ghostty/             # Ghostty terminal設定
├── dot_tmux.conf            # tmux設定
├── dot_vimrc                # Vim設定
├── dot_vimrc.dein           # dein.vimプラグイン設定
├── run_once_*.sh.tmpl       # 初回セットアップスクリプト
│   ├── 10_install-homebrew  # Homebrewインストール
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

## ライセンス

MIT
