#!/bin/bash

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"

echo "🚀 Installing dotfiles..."

# Zsh
if [ -f "$DOTFILES_DIR/zsh/.zshrc" ]; then
    ln -sf "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
    echo "✅ Linked .zshrc"
fi

# Ghostty
if [ -f "$DOTFILES_DIR/ghostty/config" ]; then
    mkdir -p "$HOME/.config/ghostty"
    ln -sf "$DOTFILES_DIR/ghostty/config" "$HOME/.config/ghostty/config"
    echo "✅ Linked ghostty/config"
fi

# Tmux
if [ -f "$DOTFILES_DIR/tmux/tmux.conf" ]; then
    ln -sf "$DOTFILES_DIR/tmux/tmux.conf" "$HOME/.tmux.conf"
    echo "✅ Linked tmux.conf"
fi

# TPM (Tmux Plugin Manager)
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
    echo "✅ Installed TPM"
else
    echo "✅ TPM already installed"
fi

# Yazi
if [ -d "$DOTFILES_DIR/yazi" ]; then
    mkdir -p "$HOME/.config/yazi"
    ln -sf "$DOTFILES_DIR/yazi/keymap.toml" "$HOME/.config/yazi/keymap.toml"
    echo "✅ Linked yazi/keymap.toml"
fi

# gwq (Git Worktree Manager)
if ! command -v gwq &> /dev/null; then
    echo "📦 Installing gwq..."
    brew install d-kuro/tap/gwq
    echo "✅ Installed gwq"
else
    echo "✅ gwq already installed"
fi

if [ -f "$DOTFILES_DIR/gwq/config.toml" ]; then
    mkdir -p "$HOME/.config/gwq"
    ln -sf "$DOTFILES_DIR/gwq/config.toml" "$HOME/.config/gwq/config.toml"
    echo "✅ Linked gwq/config.toml"
fi

# Neovim
if [ -d "$DOTFILES_DIR/nvim" ]; then
    rm -rf "$HOME/.config/nvim"
    ln -sf "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
    echo "✅ Linked nvim"
fi

echo "🎉 Done!"
