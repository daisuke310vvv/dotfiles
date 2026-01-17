#!/bin/bash

# gwqでworktreeを作成し、新しいtmuxウィンドウで開く
# 使用方法: tmux-gwq-worktree.sh

set -e

# ghqでリポジトリを選択
repo=$(ghq list | fzf --prompt="Select repository > " --preview "ls -la $(ghq root)/{}" --preview-window=right:50%)

if [ -z "$repo" ]; then
  exit 0
fi

repo_path="$(ghq root)/$repo"

# リポジトリディレクトリに移動
cd "$repo_path"

# 既存のブランチとリモートブランチを取得して、fzfで選択または新規入力
branch_name=$(
  {
    git branch --all --format='%(refname:short)' | sed 's|^origin/||' | sort -u
    echo ""
  } | fzf --prompt="Select or type new branch name > " \
      --print-query \
      --preview "git log --oneline --graph --color=always {}" \
      --preview-window=right:50% | tail -1
)

if [ -z "$branch_name" ]; then
  echo "Branch name is required"
  exit 1
fi

# リポジトリディレクトリに移動してgwqでworktreeを作成
cd "$repo_path"
gwq add -b "$branch_name"

# worktreeのパスを取得
worktree_path=$(gwq get "$branch_name")

if [ -z "$worktree_path" ]; then
  echo "Failed to get worktree path"
  exit 1
fi

# tmux内にいる場合、新しいウィンドウを作成
if [ -n "$TMUX" ]; then
  tmux new-window -n "$branch_name" -c "$worktree_path"
else
  echo "Not in tmux session. Worktree created at: $worktree_path"
fi
