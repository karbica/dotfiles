-- neovim api aliases
local cmd = vim.cmd
local exec = vim.api.nvim_exec
local fn = vim.fn
local g = vim.g
local opt = vim.opt

-- general
g.mapleader = ' '
opt.clipboard = 'unnamedplus'
opt.swapfile = false

-- ui
opt.number = true
opt.relativenumber = true
opt.showmatch = true
opt.foldmethod = 'marker'
opt.splitright = true
opt.splitbelow = true
opt.signcolumn = 'yes'
opt.wildmenu = true
opt.wildmode = 'list:full,full'
opt.cmdheight = 2
opt.smartcase = true
opt.ignorecase = true
opt.showmode = false
opt.list = true
opt.listchars = {
  tab = '⨼ ',
  nbsp = '␣',
  trail = '‧',
  eol = '↯',
  precedes = '«',
  extends = '»',
}
-- hide the vertical line character
cmd [[ set fillchars+=vert:\ ]]

-- memory, cpu
opt.hidden = true
opt.history = 100
opt.lazyredraw = true
opt.synmaxcol = 256

-- colorscheme
opt.termguicolors = true
require('github-theme').setup({
  theme_style = 'dimmed',
})

-- tabs, indent
local indent = 2
opt.expandtab = true
opt.shiftwidth = indent
opt.tabstop = indent
opt.smartindent = true
 -- stop auto comment on new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- autocompletion
opt.completeopt = 'menu,menuone,noselect'

-- terminal
-- enter insert mode when focusing terminal
-- close terminal buffer on process exit
cmd [[
  autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
  autocmd TermOpen * startinsert
  autocmd BufLeave term://* stopinsert
]]
