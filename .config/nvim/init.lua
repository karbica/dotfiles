-- HELPERS
local g = vim.g
local fn = vim.fn
local cmd = vim.cmd
local scopes = {
	o = vim.o,  -- nvim global options table
	b = vim.bo, -- nvim buffer options table
	w = vim.wo  -- nvim window options table
}

-- convenient option setter
local function opt(scope, key, value)
	scopes[scope][key] = value
	if scope ~= 'o' then scopes['o'][key] = value end
end

-- convenient keymap setter
local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then options = vim.tbl_extend('force', options, opts) end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- PLUGINS
cmd 'packadd paq-nvim'
local paq = require('paq-nvim').paq
paq {'savq/paq-nvim', opt=true}
paq 'kjssad/quantum.vim'
paq 'ayu-theme/ayu-vim'
paq 'hoob3rt/lualine.nvim'
paq 'tpope/vim-commentary'
paq 'justinmk/vim-sneak'
paq 'nvim-lua/popup.nvim'
paq 'nvim-lua/plenary.nvim'
paq 'nvim-telescope/telescope.nvim'
paq 'nvim-treesitter/nvim-treesitter'

-- COLORSCHEME
g["ayucolor"] = 'dark'
cmd 'colorscheme quantum'

-- OPTIONS
g.mapleader = " "
local indent = 2
opt('b', 'expandtab', false)
opt('b', 'smartindent', true)
opt('b', 'shiftwidth', indent)
opt('b', 'tabstop', indent)
opt('w', 'list', true)
opt('w', 'number', true)
opt('w', 'relativenumber', true)
opt('w', 'wrap', false)
opt('w', 'signcolumn', 'yes')
opt('w', 'listchars', 'tab:⟶ ,nbsp:␣,trail:‧,eol:↯,precedes:«,extends:»')
opt('o', 'termguicolors', true)
opt('o', 'hidden', true)
opt('o', 'wildmode', 'list:longest')
opt('o', 'ignorecase', true)
opt('o', 'smartcase', true)
opt('o', 'splitright', true)
opt('o', 'splitbelow', true)
opt('o', 'shiftround', true)
opt('o', 'scrolloff', 4)
opt('o', 'sidescrolloff', 8)

-- MAPPINGS
map('i', 'jj', '<Esc>');
map('n', '<C-l>', '<cmd>noh<CR>')
map('n', '<leader>hs', '<C-W>s<C-W>j<CR>')
map('n', '<leader>vs', '<C-W>v<C-W>l<CR>')
map('n', '<leader>ff', '<cmd>lua require(\'telescope.builtin\').find_files()<CR>')
-- map('n', '<leader>fg', '<cmd>lua require(\'telescope.builtin\').live_grep()<CR>')

-- TREESITTER
local ts = require('nvim-treesitter.configs')
ts.setup { ensure_installed = 'maintained', hightlight = {enable = true} }

-- LUALINE
require('lualine').setup {
	options = {
		section_separators = {'🮧', '🮧'},
		component_separators = {'', ''}
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch'},
		lualine_c = {'filename'},
		lualine_x = {'encoding', 'filetype'},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
	}
}
