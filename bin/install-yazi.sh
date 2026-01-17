#!/bin/bash

set -e

echo "🚀 Installing yazi and dependencies..."

# yazi本体
brew install yazi

# プレビュー機能強化用（オプション）
brew install ffmpegthumbnailer unar jq poppler fd ripgrep fzf zoxide

echo "🎉 Done! yazi is ready to use."
