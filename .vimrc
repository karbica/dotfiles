" set the amount of lines to remember
set history=500

" set autoread when the file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" set the leader key
let mapleader = " "

" set fast saving
nmap <leader>w :w!<cr>

" remove vi compatibility
set nocompatible

" use the system clipboard as register
set clipboard=unnamed

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" set the amount of lines that keep the cursor vertical during movement
set so=7

" turn on wild menu
set wildmenu

" show current position
set ruler

" set command bar height
set cmdheight=1

" buffer becomes hidden when abandoned
set hid

" make backspace better
set backspace=eol,start,indent
set whichwrap=<,>,h,l

" ignore case when searching
set ignorecase

" case sensitive searching until a capital letter occurs
set smartcase

" highlight search results
set hlsearch

" stop redraw when running macros for performance
set lazyredraw

" for regular expressions turn magic on
set magic

" show matching bracket when over them
set showmatch

" how many tenths of second to blink when matched bracket
set mat=2

" turn off the error bells
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" set the tab and soft tab width
set tabstop=4
set softtabstop=4

" set the shift width
set shiftwidth=4

" add some margin to the left
" set foldcolumn=1

" convert tab characters to spaces
set expandtab

" attempt to ident according to scope
set smartindent

" set the line numbers
set number

" let the line run off the screen
set nowrap

" display results as search occurs
set incsearch

" turn on syntax coloring
syntax on

" handle gnome terminal colors
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" set background to dark
set background=dark

" set standard encoding
set encoding=utf8

" enable true color support
set termguicolors

" set unix as the standard file type
set ffs=unix,dos,mac

" turn off the use of swap files
set noswapfile

" turn off the use of backups
set nobackup

" set the location of the undo directory
set undodir=~/.config/nvim/undo

" create an undo file per file
set undofile

" handle file types
filetype plugin indent on

" close all the buffers
map <leader>ba :bufdo bd<cr>
map <leader>bd :bd<cr>
map <leader>bl :bnext<CR>
map <leader>bh :bprevious<cr>

" useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" useful mappings for managing splits
map <leader>sj <C-W><C-J>
map <leader>sk <C-W><C-K>
map <leader>sh <C-W><C-H>
map <leader>sl <C-W><C-L>

" opens a new tab with the current buffer's path
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" use * or # to search for current selection
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" always show the status line
set laststatus=2

" turn off the mode line
set noshowmode

" returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" vimp-plug
call plug#begin('~/.config/nvim/plugged')

" gruvbox color scheme
" Plug 'morhetz/gruvbox'

" ayu color scheme
" Plug 'ayu-theme/ayu-vim'

" upgrade the status line
Plug 'vim-airline/vim-airline'

" language packs
Plug 'sheerun/vim-polyglot'

" fuzzy searching features
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" let ayucolor="mirage"
" colorscheme ayu
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
