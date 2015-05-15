"-- NeoBundle
filetype off
filetype plugin indent off

if	has('vim_starting')
	if &compatible
		set nocompatible
	endif
	" runtimepath: vim起動時に読み込むpluginリストのディレクトリ指定
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" if_luaが有効ならneocompleteを使う
NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'

if neobundle#is_installed('neocomplete')
	" neocomplete用設定
	let g:neocomplete#enable_at_startup = 1
	let g:neocomplete#enable_ignore_case = 1
	let g:neocomplete#enable_smart_case = 1

	if !exists('g:neocomplete#keyword_patterns')
		let g:neocomplete#keyword_patterns = {}
	endif

	let g:neocomplete#keyword_patterns._ = '\h\w*'

elseif neobundle#is_installed('neocomplcache')
	" neocomplcache用設定
	NeoBundleLazy "Shougo/neocomplcache.vim", {
				\ "autoload" : {
				\	"insert" : 1,
				\ }}
	let g:neocomplcache_enable_at_startup = 1
	let g:neocomplcache_enable_smart_case = 1

	let s:hooks = neobundle#get_hooks("neocomplcache.vim")
	function! s:hooks.on_source(bundle)
		let g:acp_enableAtStartup = 0
		let g:neocompcache_enable_smart_case = 1
	endfunction

	if !exists('g:neocomplcache_keyword_patterns')
		let g:neocomplcache_keyword_patterns = {}
	endif

	let g:neocomplcache_keyword_patterns._ = '\h\w*'
	let g:neocomplcache_enable_camel_case_completion = 1
	let g:neocomplcache_enable_underbar_completion = 1
endif

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

"- snippet
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

"- My snippets
let g:neosnipet#snippets_directory = "~/dotfiles/.vim/snippets/"
"- ファイルの拡張子で読み込むsnippet指定
augroup filetypedetect
	autocmd! BufEnter *.html NeoSnippetSource ~/dotfiles/.vim/snippets/html.snip
	autocmd! BufEnter *.jsp NeoSnippetSource ~/dotfiles/.vim/snippets/jsp.snip
augroup END

"- <C-k>でsnippet展開
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
	
"- vim中の非同期処理
NeoBundle 'Shougo/vimproc',{
	\ "build" : {
		\ "windows"	: "make -f make_mingw32.mak",
		\ "cygwin"	: "make -f make_cygwin.mak",
		\ "mac"		: "make -f make-mac.mak",
		\ "unix"	: "make -f make_unix.mak",
		\ }
		\}

"- vim中にshell
NeoBundle 'Shougo/vimshell'
nnoremap <silent>,is :VimShell<CR>

"- <C-_><C-_>で行コメントアウト
NeoBundle 'tomtom/tcomment_vim'

"- indentの深さを表示
NeoBundle 'Yggdroot/indentLine'
set list lcs=tab:\¦\ 

"- vim中左側にツリーメニュー
NeoBundle 'scrooloose/nerdtree'
autocmd VimEnter * NERDTree

"- syntax
NeoBundle 'chriskempson/vim-tomorrow-theme'

" "- 構文チェック
" NeoBundle "scrooloose/syntastic",{
" 			\ "build" : {
" 			\ "mac" : ["pip install flake8","npm -g install coffeelint"],
" 			\ "unix" : ["pip install flake8","npm -g install coffeelint"],
" 			\ }}

"- 囲み文字操作
NeoBundle 'tpope/vim-surround'

"- vim-scala
NeoBundle 'derekwyatt/vim-scala'

NeoBundleCheck
call neobundle#end()

filetype plugin indent on
syntax on
syntax enable
colorscheme Tomorrow-Night-Bright

"-
set number
set hls
set nobackup
set noswapfile
set nowritebackup
set vb t_vb=
set novisualbell

"- deleteキー対策
set backspace=indent,eol,start
set list

"- indent
set autoindent
"set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx-213,euc-jp,sjis,cp932

"- 改行で勝手にコメントが入らないように
autocmd FileType * setlocal formatoptions-=ro

"- macro
"- 素早くjjを押した場合ESC
inoremap jj <Esc>

"- 閉じ括弧補完
inoremap ( ()
inoremap { {}
inoremap [ []
inoremap < <>

"- <C-c>２回でハイライト消す
set hlsearch
nmap <silent> <C-c><C-c> :nohlsearch<CR>

"- テキスト折り返しでも自然なj,k移動
nnoremap j gj
nnoremap k gk

"- Ctrl + hjklでウィンドウ間移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"- コンマの後に自動的にスペース挿入
inoremap , ,<Space>

"- Window
"- sキー割り当て無効
nnoremap s <Nop>
"- 縦横最大化
"- 大きさを揃える
nnoremap s= <C-w>=
"- 幅を増やす
nnoremap s> <C-w>>
"- 幅を減らす
nnoremap s< <C-w>< 

if has("autocmd")
	filetype indent on
	autocmd FileType ruby		setlocal sw=2 sts=2 ts=2 et
	autocmd FileType eruby		setlocal sw=2 sts=2 ts=2 et
	autocmd FileType scss		setlocal sw=2 sts=2 ts=2 et
	autocmd FileType html		setlocal sw=4 sts=4 ts=4 et
	autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
endif
