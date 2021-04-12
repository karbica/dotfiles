" BASICS
syntax on
set autoread
set encoding=utf8
set noerrorbells
set belloff=all
set tm=500
set expandtab
set number
set nowrap
set nobackup
set noswapfile
set smartcase
set ignorecase
set noswapfile
set nobackup
set incsearch
set hlsearch
set autoindent
set smartindent
set laststatus=2
set history=500
set wildmenu
set showmatch
set timeout
set timeoutlen=350
set ruler
set hidden
set so=7
set magic
set cmdheight=1
set backspace=eol,start,indent
set whichwrap=<,>,h,l
set mat=2
set tabstop=4
set softtabstop=4
set shiftwidth=4
set ffs=unix,dos,mac
filetype plugin indent on

" LEADER
let mapleader = " "

" KEYMAPS
nnoremap <Leader>b :buffers<CR>:buffer<Space>
map <leader>bq :bufdo bd<CR>
map <leader>bw :bd<CR>
map <leader>bl :bnext<CR>
map <leader>bh :bprevious<CR>
map <leader>tn :tabnew<CR>
map <leader>sj <C-W><C-J>
map <leader>sk <C-W><C-K>
map <leader>sh <C-W><C-H>
map <leader>sl <C-W><C-L>

" PLUGINS
call plug#begin('~/.config/nvim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'
call plug#end()
