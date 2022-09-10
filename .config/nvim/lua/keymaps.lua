-- neovim api aliases
local map = vim.api.nvim_set_keymap
local cmd = vim.cmd

-- defaults
local default_opts = { noremap = true, silent = true }

-- clear search highlighting
map('n', '<leader>l', ':nohl<CR>', default_opts)

-- remap esc to jj
map('i', 'jj', '<Esc>', { noremap = true })

-- quick reload of neovim settings
map('n', '<leader>5', '<cmd>luafile %<CR>', default_opts)

-- interact with buffers
map('n', '<leader>bn', '<cmd>bnext<CR>', default_opts)
map('n', '<leader>bp', '<cmd>bprev<CR>', default_opts)
map('n', '<leader>bw', '<cmd>bd!<CR>', default_opts)
map('n', '<leader>bq', '<cmd>%bd!|e#|bd#<CR>', default_opts)

-- lose the arrow keys
map('', '<up>', '<noop>', { noremap = true })
map('', '<down>', '<noop>', { noremap = true })
map('', '<left>', '<noop>', { noremap = true })
map('', '<right>', '<noop>', { noremap = true })

-- faster saving
map('n', '<leader>w', ':w<CR>', default_opts)

-- splits
map('n', '<C-w>w', '<cmd>bd!<CR>', default_opts)
map('n', '<leader>hs', '<C-w>S<C-w>j<CR>', default_opts)
map('n', '<leader>vs', '<C-w>v<C-w>l<CR>', default_opts)
map('n', '<C-h>', '<C-w>h', default_opts)
map('n', '<C-j>', '<C-w>j', default_opts)
map('n', '<C-k>', '<C-w>k', default_opts)
map('n', '<C-l>', '<C-w>l', default_opts)

-- close all windows and exit from neovim
map('n', '<leader>q', ':qa!<CR>', default_opts)

-- open terminal
map('n', '<leader>ht', '<cmd>:split +terminal<CR>', default_opts)
map('n', '<leader>vt', '<cmd>:vsplit +terminal<CR>', default_opts)

-- telescope
map('n', '<leader>ff', '<cmd>lua require(\'telescope.builtin\').find_files({ follow = true, hidden = true, files = true })<CR>', default_opts)
map('n', '<leader>fg', '<cmd>lua require(\'telescope.builtin\').live_grep()<CR>', default_opts)
map('n', '<leader>fb', '<cmd>lua require(\'telescope.builtin\').buffers()<CR>', default_opts)
