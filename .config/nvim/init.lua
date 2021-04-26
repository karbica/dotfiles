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
paq 'folke/tokyonight.nvim'
paq 'hoob3rt/lualine.nvim'
paq 'tpope/vim-commentary'
paq 'justinmk/vim-sneak'
paq 'nvim-lua/popup.nvim'
paq 'nvim-lua/plenary.nvim'
paq 'nvim-telescope/telescope.nvim'
paq 'nvim-treesitter/nvim-treesitter'
paq {'lukas-reineke/indent-blankline.nvim', branch='lua'}
paq 'windwp/nvim-autopairs'
paq 'neovim/nvim-lspconfig'
paq 'kabouzeid/nvim-lspinstall'

-- COLORSCHEME
g["tokyonight_style"] = "storm"
vim.cmd[[colorscheme tokyonight]]

-- OPTIONS
g.mapleader = " "
local indent = 2
opt('b', 'expandtab', true)
opt('b', 'smartindent', true)
opt('b', 'shiftwidth', indent)
opt('b', 'tabstop', indent)
opt('w', 'list', true)
opt('w', 'number', true)
opt('w', 'relativenumber', true)
opt('w', 'wrap', false)
opt('w', 'signcolumn', 'yes')
opt('w', 'listchars', 'tab:⨼ ,nbsp:␣,trail:‧,eol:↯,precedes:«,extends:»')
opt('o', 'termguicolors', true)
opt('o', 'hidden', true)
opt('o', 'wildmenu', true)
opt('o', 'wildmode', 'list:full,full')
opt('o', 'ignorecase', true)
opt('o', 'smartcase', true)
opt('o', 'splitright', true)
opt('o', 'splitbelow', true)
opt('o', 'shiftround', true)
opt('o', 'scrolloff', 4)
opt('o', 'sidescrolloff', 8)
opt('o', 'showtabline', 0)
opt('o', 'showmode', false)
opt('o', 'cmdheight', 2)
cmd 'set noswapfile' -- How to do this through Lua?
-- map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
-- map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})

-- MAPPINGS
map('', '<leader>y', '"+y')
map('i', 'jj', '<Esc>');
map('n', '<C-l>', '<cmd>noh<CR>')
map('t', '<Esc>', '<C-\\><C-N>')
map('n', '<leader>hs', '<C-W>s<C-W>j<CR>')
map('n', '<leader>vs', '<C-W>v<C-W>l<CR>')
map('n', '<leader>5', '<cmd>luafile %<CR>')
map('n', '<leader>ff', '<cmd>lua require(\'telescope.builtin\').find_files()<CR>')
-- map('n', '<leader>fg', '<cmd>lua require(\'telescope.builtin\').live_grep()<CR>')

-- AUTOPAIRS
require('nvim-autopairs').setup()

-- SNEAK
g['sneak#label'] = 1
-- cmd 'highlight SneakLabel guifg=yellow guibg=8 ctermfg=black ctermbg=blue'

-- TREESITTER
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = {
    enable = true
  },
  autotag = {
    enable = true
  },
  context_commentstring = {
    enable = true
  },
  ensure_installed = "maintained",
}

-- LUALINE
require('lualine').setup {
  options = {
    section_separators = {'🮧', '🮧'},
    component_separators = {'۰', '۰'},
    theme = 'tokyonight',
    icons_enabled=false
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename', {'diagnostics', sources={'nvim_lsp'}}},
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

-- INDENTLINE
-- g['indent_blankline_filetype_exclude'] = "['help']"
-- g['indent_blankline_buftype_exclude'] = "['terminal']"
g['indentLine_fileTypeExclude'] = {'help'}
g['indentLine_bufTypeExclude'] = {'terminal'}

-- LSP
local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{}
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
