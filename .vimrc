
filetype plugin indent on
syntax enable

set number 
set autoindent 
syntax on
set tabstop=4
set shiftwidth=2

nnoremap <Space>. :<C-u>edit $MYVIMRC<Enter>
nnoremap <Space>s. :<C-u>source $MYVIMRC<Enter>


set backspace=eol,indent,start

set encoding=utf-8
"set encoding=eucjp
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx-213,euc-jp,sjis,cp932


let g:neocomplcache_enable_at_startup = 1
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif 
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif

let g:neocomplcache_force_overwrite_completefunc = 1
let g:neocomplcache_force_omni_patterns.c = 
	  \ '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = 
	  \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::' 
let g:neocomplcache_force_omni_patterns.objc = 
	  \ '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.objccp = 
	  \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_complete_include_current_directory_recursively=1

set nocompatible
filetype off

set rtp+=~/.vim/vundle.git
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'git://github.com/tokorom/clang_complete.git'
Bundle 'git://github.com/tokorom/clang_complete-getopts-ios.git'
Bundle 'https://github.com/scrooloose/nerdtree.git'

filetype plugin indent on

autocmd VimEnter * NERDTree


highlight Normal ctermbg=none





