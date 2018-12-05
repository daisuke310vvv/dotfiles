if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go'
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/AnsiEsc.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Yggdroot/indentLine'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
call plug#end()


let g:python3_host_prog=expand('/usr/bin/python3')
let g:deoplete#enable_at_startup=1

let g:indent_guides_enable_on_vim_startup = 1

let g:go_fmt_command = "goimports"

let &t_ti.="\e[4 q"

autocmd vimenter * NERDTree
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable  = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'

set ruler
set title
set number
set list
set listchars=tab:▸\ ,eol:↲,extends:❯,precedes:❮
set whichwrap=b,s,h,l,<,>,[,],~
set hidden
set showcmd
set nobackup
set wildmenu
set virtualedit=onemore
set autowrite
set noswapfile
set cmdheight=2
set smartcase
set incsearch
set autoindent
set smartindent
set tabstop=4
set smarttab
set expandtab
set shiftwidth=4
set softtabstop=2
set backspace=indent,eol,start
set ignorecase
set hlsearch
set colorcolumn=80
set pumheight=10
set laststatus=2
set spell
set spelllang=en,cjk
set cursorline
set encoding=utf-8
set fileencoding=utf-8
set showmatch
set matchtime=1

hi clear CursorLine
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

syntax on
colorscheme tender

inoremap jj <Esc>
inoremap jk <C-x><C-o>

nnoremap <slient> <C-c><C-c> :nohlsearch<CR>
nnoremap j gj
nnoremap k gk

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <S-h> 5<LEFT>
nnoremap <S-j> 5<DOWN>
nnoremap <S-k> 5<UP>
nnoremap <S-l> 5<RIGHT>

vnoremap <S-h> 5<LEFT>
vnoremap <S-j> 5<DOWN>
vnoremap <S-k> 5<UP>
vnoremap <S-l> 5<RIGHT>

autocmd FileType go :highlight goErr cterm=bold ctermfg=214
autocmd FileType go :match goErr /\<err\>/
