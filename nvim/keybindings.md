# Neovim キーバインディング一覧

## 基本設定

### リーダーキー
- **Leader**: `Space`
- **Local Leader**: `Space`

---

## 基本操作

### モード切り替え
| キー | モード | 動作 | 説明 |
|------|--------|------|------|
| `jk` | Insert | `<Esc>` | インサートモードから抜ける |
| `<Esc>` | Normal | `<cmd>nohlsearch<CR>` | 検索ハイライトをクリア |

### ファイル操作
| キー | モード | 動作 | 説明 |
|------|--------|------|------|
| `<leader>w` | Normal | `<cmd>w<CR>` | ファイルを保存 |
| `<leader>q` | Normal | `<cmd>q<CR>` | 終了 |

### ウィンドウ移動
| キー | モード | 動作 | 説明 |
|------|--------|------|------|
| `<C-h>` | Normal | `<C-w>h` | 左のウィンドウへ移動 |
| `<C-j>` | Normal | `<C-w>j` | 下のウィンドウへ移動 |
| `<C-k>` | Normal | `<C-w>k` | 上のウィンドウへ移動 |
| `<C-l>` | Normal | `<C-w>l` | 右のウィンドウへ移動 |
| `<leader>h` | Normal | `<C-w>h` | 左のウィンドウへ移動（tmux用） |
| `<leader>j` | Normal | `<C-w>j` | 下のウィンドウへ移動（tmux用） |
| `<leader>k` | Normal | `<C-w>k` | 上のウィンドウへ移動（tmux用） |
| `<leader>l` | Normal | `<C-w>l` | 右のウィンドウへ移動（tmux用） |

### バッファ移動
| キー | モード | 動作 | 説明 |
|------|--------|------|------|
| `<S-h>` | Normal | `<cmd>bprevious<CR>` | 前のバッファへ |
| `<S-l>` | Normal | `<cmd>bnext<CR>` | 次のバッファへ |

### 行移動（ビジュアルモード）
| キー | モード | 動作 | 説明 |
|------|--------|------|------|
| `J` | Visual | `:m '>+1<CR>gv=gv` | 選択行を下に移動 |
| `K` | Visual | `:m '<-2<CR>gv=gv` | 選択行を上に移動 |

---

## プラグイン

### Telescope（ファジーファインダー）

| キー | 動作 | 説明 |
|------|------|------|
| `<leader>ff` | `<cmd>Telescope find_files<cr>` | ファイル検索 |
| `<leader>fg` | `<cmd>Telescope live_grep<cr>` | 全文検索 |
| `<leader>fb` | `<cmd>Telescope buffers<cr>` | バッファ一覧 |
| `<leader>fh` | `<cmd>Telescope help_tags<cr>` | ヘルプタグ検索 |
| `<leader>fr` | `<cmd>Telescope oldfiles<cr>` | 最近開いたファイル |

### Neo-tree（ファイルツリー）

| キー | 動作 | 説明 |
|------|------|------|
| `<leader>e` | `<cmd>Neotree toggle<cr>` | ファイルツリーの表示切り替え |

### LSP（Language Server Protocol）

| キー | 動作 | 説明 |
|------|------|------|
| `gd` | `vim.lsp.buf.definition` | 定義へジャンプ |
| `gr` | `vim.lsp.buf.references` | 参照箇所へジャンプ |
| `K` | `vim.lsp.buf.hover` | ホバー情報を表示 |
| `<leader>ca` | `vim.lsp.buf.code_action` | コードアクション |
| `<leader>rn` | `vim.lsp.buf.rename` | リネーム |
| `[d` | `vim.diagnostic.goto_prev` | 前の診断へ移動 |
| `]d` | `vim.diagnostic.goto_next` | 次の診断へ移動 |

### nvim-cmp（自動補完）

| キー | モード | 動作 | 説明 |
|------|--------|------|------|
| `<C-b>` | Insert | scroll_docs(-4) | ドキュメントを上にスクロール |
| `<C-f>` | Insert | scroll_docs(4) | ドキュメントを下にスクロール |
| `<C-Space>` | Insert | complete() | 補完を起動 |
| `<C-e>` | Insert | abort() | 補完を中止 |
| `<CR>` | Insert | confirm() | 補完を確定 |
| `<Tab>` | Insert/Select | select_next_item() | 次の補完候補へ |
| `<S-Tab>` | Insert/Select | select_prev_item() | 前の補完候補へ |

### Gitsigns（Git連携）

| キー | 動作 | 説明 |
|------|------|------|
| `]c` | `gs.next_hunk` | 次のhunkへ移動 |
| `[c` | `gs.prev_hunk` | 前のhunkへ移動 |
| `<leader>hs` | `gs.stage_hunk` | hunkをステージ |
| `<leader>hr` | `gs.reset_hunk` | hunkをリセット |
| `<leader>hp` | `gs.preview_hunk` | hunkをプレビュー |

### LazyGit

| キー | 動作 | 説明 |
|------|------|------|
| `<leader>gg` | `<cmd>LazyGit<cr>` | LazyGitを起動 |

---

## キーバインドグループ（which-key）

| プレフィックス | グループ名 | 説明 |
|----------------|-----------|------|
| `<leader>f` | Find | Telescope検索機能 |
| `<leader>g` | Git | Git関連機能 |
| `<leader>h` | Hunk | Git hunk操作 |
| `<leader>c` | Code | コード操作 |
| `<leader>r` | Rename | リネーム操作 |

---

## 補足

- **tmux上でCtrlキーが効かない場合**: `<leader>h/j/k/l`でウィンドウ移動可能
- **which-key**: `<leader>`を押すと、利用可能なキーバインドがポップアップ表示される
- **自動補完**: `<Tab>`でスニペットのジャンプも可能
