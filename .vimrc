"===========================================================
" NeoBundle
"===========================================================
set nocompatible
filetype off


let s:noplugin = 0
let s:bundle_root = expand('~/.vim/bundle')
let s:neobundle_root = s:bundle_root . '/neobundle.vim'
if !isdirectory(s:neobundle_root) || v:version < 702
	"NeoBundleが存在しない、もしくはVimのバージョンが古い場合
	"は一切読み込まない
	let s:noplugin = 1
else
	"NeoBundleを'runtimepath'に追加し初期化を行う
	if has('vim_starting')
		execute "set runtimepath+=" . s:neobundle_root
	endif
	call neobundle#rc(s:bundle_root)
	
	" NeoBundle自身をNeoBudleで管理させる
	NeoBundleFetch 'Shougo/neobundle.vim'

	
	"------------------------------------------------------
	" vimproc
	"------------------------------------------------------
    "非同期通信を可能にする
    "'build'が指定されているのでインストール時に自動的に
    "指定されたコマンドが実行されvimprocがコンパイルされる
    NeoBundle "Shougo/vimproc", {
				\ "build" : {
				\ "windows" : "make -f make_mingw32.mak",
				\ "cygwin"  : "make -f make_cygwin.mak",
				\ "mac"     : "make -f make-mac.mak",
				\ "unix"    : "make -f make_unix.mak",
				\ }}
	"------------------------------------------------------
	"------------------------------------------------------
	
	"------------------------------------------------------
	" vimshell
	"------------------------------------------------------
	NeoBundle "Shougo/vimshell"	
	"------------------------------------------------------
	"------------------------------------------------------

	"------------------------------------------------------
	" neocomplete
	"------------------------------------------------------
	if has('lua') && v:version >= 703 && has('patch885')
		NeoBundleLazy "Shougo/neocomplete.vim",{
					\ "autoload" : {
					\ "insert"   : 1, 
					\ }}
		let g:neocomplete#enable_at_startup = 1
		let s:hooks = neobundle#get_hooks("neocomplete.vim")
		function! s:hooks.on_source(bundle)
			let g:acp_enableAtStartup = 0
			let g:neocomplet#enable_smart_case = 1
			" NeoComleteを有効化
			" NeoCompleteEnable
		endfunction
	else
		NeoBundleLazy "Shougo/neocomplcache.vim",{
					\ "autoload" :{
					\ "insert"   : 1,
					\ }}
		let g:neocomplcache_enable_at_startup = 1
		let s:hooks = neobundle#get_hooks("neocomplcache.vim")
		function! s:hooks.on_source(bundle)
			let g:acp_enableAtStartup = 0
			let g:neocomplcache_enable_smart_case = 1
			" NeoComplCacheを有効化
			" NeoCompeCacheEnable
		endfunction
	endif
	"------------------------------------------------------
	"------------------------------------------------------

	"------------------------------------------------------
	" Neosnippet.vim
	"------------------------------------------------------
	NeoBundleLazy "Shougo/neosnippet.vim",{
				\ "depends" : ["honza/vim-snippets"],
				\ "autoload" :{
				\ }}
	let s:hooks = neobundle#get_hooks("neosnippet.vim")
	function! s:hooks.on_source(bundle)
	" Plugin key-mappings.
	imap <C-k>  <Plug>(neosnippet_expand_or_jump)
	smap <C-k>  <Plug>(neosnippet_expand_or_jump)
	xmap <C-k>  <Plug>(neosnippet_expand_or_jump)
	" supertab like snipets behavior
	imap <expr><TAB>neosnippet#expandable_or_jump() ?
				\ "\<Plug>(neosnippet_expand_or_jump)"
				\: "\<TAB>"
	" For snippet_complete marker
	if has('conceal')
		set g:neosnippet#enable_anipmate_compatibility = 1
		"Tell Neosnipet about the other snippets
		let g:neosnippet#snippets_directory = s:bundle_root . '/vim-snippets/snippets'
	endfunction
	"------------------------------------------------------
	"------------------------------------------------------


	"------------------------------------------------------
	" indentLine
	"------------------------------------------------------
	NeoBundle "Yggdroot/indentLine"
	set list lcs=tab:\¦\ 
	"------------------------------------------------------
	"------------------------------------------------------
	
	"write the bundle you want to install. 
	NeoBundle 'scrooloose/nerdtree'
	NeoBundle 'tpope/vim-surround'
	NeoBundle 'vim-scripts/Align'
	NeoBundle 'vim-scripts/YankRing.vim'
	NeoBundle 'altercation/vim-colors-solarized'
	NeoBundle 'w0ng/vim-hybrid'
	NeoBundle 'nanotech/jellybeans.vim'
	NeoBundle 'vim-scripts/rdark'
	NeoBundle 'vim-scripts/twilight'

	"------------------------------------------------------
	" syntastic
	"------------------------------------------------------
	NeoBundle "scrooloose/syntastic",{
				\ "build":{
				\ "mac": ["pip install flake8","npm -g install coffeelint"],
				\ "unix": ["pip install flake9", "npm -g install coffeelint"],
				\ }}
	"------------------------------------------------------
	"------------------------------------------------------


	"------------------------------------------------------
	" jedi-vim
	"------------------------------------------------------
	NeoBundleLazy "davidhalter/jedi-vim",{
				\ "autoload":{
				\ "filetype": ["python","python3","djangohtml"],
				\ },
				\ "build":{
				\ "mac": "pip install jedi",
				\ "unix": "pip install jedi",
				\ }}
	let s:hooks = neobundle#get_hooks("jedi-vim")
	function! s:hooks.on_source(bundle)
		" jediにvimの設定を任せると'completeopt+=preview'するので
		" 自動設定機能をOFFにして手動で設定を行う(?)
		let g:jedi#auto_vim_configuration = 0
		" 補完の最初の項目が選択された状態だと使いにくいためオフにする
		let g:jedi#popup_select_first = 0
	endfunction

	"インストールされていないプラグインのチェックおよびダウンロード
	NeoBundleCheck
endif

"ファイルタイプフラグインおよびインデントを有効化
"NeoBundleによる処理が終了したあとに呼び出す
filetype plugin indent on
filetype indent on
syntax on

"===========================================================
"===========================================================


autocmd VimEnter * NERDTree

syntax enable
"let g:solarized_termcolors=256
"set background=dark
colorscheme hybrid

set number 
set autoindent 
set shiftwidth=4
set softtabstop=4
set tabstop=4
"set expandtab
set hls
    
nnoremap <Space>. :<C-u>edit $MYVIMRC<Enter>
nnoremap <Space>s. :<C-u>source $MYVIMRC<Enter>

set backspace=eol,indent,start

set encoding=utf-8
"set encoding=eucjp
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx-213,euc-jp,sjis,cp932

hi Pmenu ctermbg=255 ctermfg=0 guifg=#000000 guibg=#999999
hi PmenuSel ctermbg=blue ctermfg=black
hi PmenuSbar ctermbg=0 ctermfg=9
hi PmenuSbar ctermbg=255 ctermfg=0 guifg=#000000 guibg=#FFFFFF


