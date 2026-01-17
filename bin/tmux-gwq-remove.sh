#!/bin/bash

# gwqでworktreeを削除する
# 使用方法: tmux-gwq-remove.sh

set -e

# gwq listで全worktreeを取得
worktrees=$(gwq list 2>/dev/null)

if [ -z "$worktrees" ]; then
  echo "No worktrees found"
  exit 0
fi

# fzfで削除対象を選択（複数選択可能）
selected=$(echo "$worktrees" | fzf \
  --prompt="Select worktree(s) to remove > " \
  --multi \
  --preview "ls -la {}" \
  --preview-window=right:50% \
  --header="TAB: select multiple, ENTER: confirm")

if [ -z "$selected" ]; then
  exit 0
fi

# 確認メッセージ
echo ""
echo "The following worktree(s) will be removed:"
echo "$selected"
echo ""
echo -n "Are you sure? (y/N): "
read -r confirm

if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
  echo "Cancelled"
  exit 0
fi

# 選択されたworktreeを削除
echo "$selected" | while IFS= read -r worktree_path; do
  if [ -n "$worktree_path" ]; then
    # worktree_pathからブランチ名を抽出（パスの最後の=以降）
    branch_name=$(basename "$worktree_path" | sed 's/.*=//')

    echo "Removing worktree: $branch_name ($worktree_path)"

    # gwq removeを実行
    if gwq remove "$branch_name" 2>/dev/null; then
      echo "✅ Removed: $branch_name"
    else
      # gwq removeが失敗した場合、git worktree removeで削除
      echo "gwq remove failed, trying git worktree remove..."
      if git worktree remove "$worktree_path" --force 2>/dev/null; then
        echo "✅ Removed: $worktree_path"
      else
        echo "❌ Failed to remove: $worktree_path"
      fi
    fi
  fi
done

echo ""
echo "Done!"
