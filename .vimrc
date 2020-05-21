" TODO Think about making this configuration file work with both Vim and NeoVim.





" GENERAL

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





" USER INTERFACE

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
set foldcolumn=1

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





" COLORS & FONTS

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





" FILES & BACKUPS

" set unix as the standard file type
set ffs=unix,dos,mac

" turn off the use of swap files
set noswapfile

" turn off the use of backups
set nobackup

" set the location of the undo directory
set undodir=~.config/nvim/undo

" create an undo file per file
set undofile





" MOVEMENT & BUFFERS

" move between splits easier
" TODO Use the leader for this.

" close all the buffers
map <leader>ba :bufdo bd<cr>

" easily move through open buffers
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 


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





" VISUAL MODE

" use * or # to search for current selection
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>





" STATUS LINE

" always show the status line
set laststatus=2

" format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" set the length colomn
" set column=80
" highlight ColorColumn ctermbg=0 guibg=lightgrey
