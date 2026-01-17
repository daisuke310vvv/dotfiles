#!/bin/bash

# ghqでリポジトリを選択し、tmuxセッションを作成またはアタッチする
# 使用方法: tmux-ghq-session.sh

set -e

# ghqとfzfでリポジトリを選択
repo=$(ghq list | fzf --preview "ls -la $(ghq root)/{}" --preview-window=right:50%)

if [ -z "$repo" ]; then
  exit 0
fi

# リポジトリのパスとセッション名を取得
repo_name=$(basename "$repo")
repo_path="$(ghq root)/$repo"
session_name="$repo_name"

# 既存のセッションをチェック
if tmux has-session -t "$session_name" 2>/dev/null; then
  # 既存のセッションが存在する場合はアタッチ
  if [ -n "$TMUX" ]; then
    # tmux内にいる場合はswitch-client
    tmux switch-client -t "$session_name"
  else
    # tmux外にいる場合はattach
    tmux attach-session -t "$session_name"
  fi
else
  # 新しいセッションを作成
  if [ -n "$TMUX" ]; then
    # tmux内にいる場合は新しいセッションを作成してswitch
    tmux new-session -d -s "$session_name" -c "$repo_path"
    tmux switch-client -t "$session_name"
  else
    # tmux外にいる場合は新しいセッションを作成してattach
    tmux new-session -s "$session_name" -c "$repo_path"
  fi
fi
