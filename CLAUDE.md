# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 🎯 リポジトリの目的

個人用dotfiles管理リポジトリ。開発環境の設定ファイルをシンボリックリンクで管理し、複数マシン間で設定を統一する。

## 📦 インストール・セットアップコマンド

### 初回セットアップ
```bash
# 全設定を一括インストール（推奨）
./bin/install.sh

# yaziとその依存関係のみインストール
./bin/install-yazi.sh
```

### 個別設定の適用
各設定ディレクトリから手動でシンボリックリンクを作成可能：
```bash
# Zsh
ln -sf ~/github.com/daisuke310vvv/dotfiles/zsh/.zshrc ~/.zshrc

# Ghostty
mkdir -p ~/.config/ghostty
ln -sf ~/github.com/daisuke310vvv/dotfiles/ghostty/config ~/.config/ghostty/config

# Tmux
ln -sf ~/github.com/daisuke310vvv/dotfiles/tmux/tmux.conf ~/.tmux.conf

# Yazi
mkdir -p ~/.config/yazi
ln -sf ~/github.com/daisuke310vvv/dotfiles/yazi/keymap.toml ~/.config/yazi/keymap.toml

# gwq（Git Worktree Manager）
mkdir -p ~/.config/gwq
ln -sf ~/github.com/daisuke310vvv/dotfiles/gwq/config.toml ~/.config/gwq/config.toml

# Neovim（将来追加予定）
ln -sf ~/github.com/daisuke310vvv/dotfiles/nvim ~/.config/nvim
```

## 🏗️ ディレクトリ構造と役割

```
dotfiles/
├── bin/              # インストール・セットアップスクリプト
│   ├── install.sh           # メインインストーラー（全設定を一括適用）
│   ├── install-yazi.sh      # yaziとその依存関係をbrewでインストール
│   ├── tmux-ghq-session.sh  # ghq+fzfでtmuxセッション作成・切り替え
│   ├── tmux-gwq-worktree.sh # gwq+fzfでworktree作成・新ウィンドウ起動
│   └── tmux-gwq-remove.sh   # gwq+fzfでworktree削除
│
├── zsh/              # Zsh設定（カスタムプロンプト、履歴管理、補完設定）
│   └── .zshrc               # メイン設定ファイル
│
├── tmux/             # tmux設定（キーバインド、外観、プラグイン管理）
│   └── tmux.conf            # メイン設定ファイル
│
├── ghostty/          # Ghosttyターミナルエミュレータ設定
│   └── config               # メイン設定ファイル
│
├── yazi/             # yaziファイルマネージャー設定
│   └── keymap.toml          # キーマップ定義
│
├── gwq/              # gwq（Git Worktree Manager）設定
│   └── config.toml          # メイン設定ファイル
│
├── nvim/             # Neovim設定（現在は空）
│
└── claude/           # Claude Code設定（将来のカスタムエージェント・コマンド用）
    ├── CLAUDE.md            # Claude Code用設定（このファイルではない）
    ├── agents/              # カスタムエージェント定義用
    ├── commands/            # カスタムコマンド定義用
    └── rules/               # プロジェクトルール定義用
```

## 🔧 重要な設定内容

### Zsh (zsh/.zshrc)
- **プロンプト**: Gitステータスに応じて色が変化するカスタムプロンプト
- **履歴管理**: 10000件の履歴、重複削除、共有設定
- **PATH設定**: Homebrew、asdf、Java、Android SDK、Ruby等のパス設定
- **ツール統合**: direnv、asdf（バージョン管理）

### tmux (tmux/tmux.conf)
- **プレフィックスキー**: `Ctrl-a`（デフォルトの`Ctrl-b`から変更）
- **ペイン分割**: `\` (縦分割), `-` (横分割)
- **vim風ナビゲーション**: `h/j/k/l`でペイン移動
- **ghq + fzf**: `Ctrl-a g`でリポジトリ選択し、セッション作成・切り替え
  - 既存セッションがあれば自動的にそのセッションに切り替え
  - 存在しない場合のみ新しいセッションを作成
  - セッション名はリポジトリ名（例: `dotfiles`）
- **gwq + fzf**: `Ctrl-a t`でworktree作成し、新しいウィンドウで開く
  - リポジトリを選択 → ブランチ名を入力または既存ブランチから選択
  - gwqで自動的にworktreeを作成
  - 新しいウィンドウを作成し、ウィンドウ名はブランチ名
  - 複数ブランチでの並行作業に最適
- **gwq削除**: `Ctrl-a e`でworktreeを削除
  - gwq listから削除対象を選択（複数選択可能）
  - 確認後にworktreeを削除
- **プラグイン**: TPM、tmux-resurrect（セッション復元）、tmux-continuum（自動保存）、tmux-fzf（`Ctrl-f`で起動）

### gwq (gwq/config.toml)
- **Worktree管理**: Git worktreeの作成・切り替え・削除をファジー検索で効率化
- **ベースディレクトリ**: `~/github.com`にworktreeを集約管理
- **命名規則**: `{{.Host}}/{{.Owner}}/{{.Repository}}={{.Branch}}`形式でディレクトリを自動命名
  - 例: `~/github.com/github.com/username/repo=feature-branch`
- **主要コマンド**:
  - `gwq add -b <branch>`: 新しいworktree作成
  - `gwq list`: worktree一覧表示
  - `cd $(gwq get <branch>)`: worktreeに移動
  - `gwq remove <branch>`: worktree削除
- **tmux統合**:
  - `Ctrl-a t`: worktree作成＋新ウィンドウ起動
  - `Ctrl-a e`: worktree削除（複数選択可能）

### 依存関係
- **Homebrew**: パッケージ管理
- **asdf**: 言語バージョン管理（Node.js、Rubyなど）
- **TPM**: tmuxプラグイン管理（install.shが自動インストール）
- **yazi依存**: ffmpegthumbnailer、unar、jq、poppler、fd、ripgrep、fzf、zoxide
- **gwq**: Git Worktree Manager（install.shが自動インストール）

## 📝 設定ファイル編集時の注意点

1. **シンボリックリンクの仕組み**: ホームディレクトリの設定ファイルは、このリポジトリの実ファイルへのシンボリックリンク。編集時は`~/.zshrc`などを直接編集してもリポジトリに反映される。

2. **tmux設定の反映**: tmux設定変更後は`Ctrl-a r`でリロード可能。

3. **Zsh設定の反映**: 新しいターミナルセッションを開くか`source ~/.zshrc`で反映。

4. **PATH設定**: 環境固有のパス（Javaパス、Android SDKパスなど）は適宜修正が必要。

5. **gwq設定**: basedirやtemplateを変更した場合、既存のworktreeには影響しない。新規作成時のみ新しい設定が適用される。

## 🚀 開発フロー

1. このリポジトリで設定ファイルを編集
2. 変更をコミット・プッシュ
3. 他のマシンでは`git pull`して最新設定を取得
4. 必要に応じて各ツールで設定をリロード
