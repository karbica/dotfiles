-- import lua modules
require('settings')
require('keymaps')
require('plugins/packer')



-- -- HELPERS
-- local g = vim.g
-- local fn = vim.fn
-- local cmd = vim.cmd

-- require('plugins')
-- require('options')

-- -- AUTOPAIRS
-- require('nvim-autopairs').setup()

-- -- SNEAK
-- g['sneak#label'] = 1
-- -- cmd 'highlight SneakLabel guifg=yellow guibg=8 ctermfg=black ctermbg=blue'

-- -- TREESITTER
-- require('nvim-treesitter.configs').setup {
--   highlight = {
--     enable = true,
--     use_languagetree = true,
--   },
--   indent = {
--     enable = true
--   },
--   autotag = {
--     enable = true
--   },
--   context_commentstring = {
--     enable = true
--   },
--   ensure_installed = "maintained",
-- }

-- -- LUALINE
-- require('lualine').setup {
--   options = {
--     section_separators = {'', ''},
--     component_separators = {'⦁', '⦁'},
--     theme = 'tokyonight',
--     icons_enabled=false
--   },
--   sections = {
--     lualine_a = {'mode'},
--     lualine_b = {'branch'},
--     lualine_c = {'filename', {'diagnostics', sources={'nvim_diagnostic'}}},
--     lualine_x = {'encoding', 'filetype'},
--     lualine_y = {'progress'},
--     lualine_z = {'location'}
--   },
--   inactive_sections = {
--     lualine_a = {},
--     lualine_b = {},
--     lualine_c = {'filename'},
--     lualine_x = {'location'},
--     lualine_y = {},
--     lualine_z = {}
--   }
-- }

-- -- INDENTLINE
-- g['indentLine_fileTypeExclude'] = {'help', 'packer'}
-- g['indentLine_bufTypeExclude'] = {'terminal'}

-- -- GITSIGNS
-- require('gitsigns').setup({
--   signs = {
--     add = { text = '❙' },
--     change = { text = '❙' },
--   }
-- })

-- -- LSP
-- local function setup_servers()
--   require'lspinstall'.setup()
--   local servers = require'lspinstall'.installed_servers()
--   for _, server in pairs(servers) do
--     require'lspconfig'[server].setup{}
--   end
-- end

-- -- setup_servers()

-- -- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
-- --[[ require'lspinstall'.post_install_hook = function ()
--   setup_servers() -- reload installed servers
--   vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
-- end ]]

-- -- COMPE
-- require'compe'.setup {
--   enabled = true;
--   autocomplete = true;
--   debug = false;
--   min_length = 1;
--   preselect = 'enable';
--   throttle_time = 80;
--   source_timeout = 200;
--   incomplete_delay = 400;
--   max_abbr_width = 100;
--   max_kind_width = 100;
--   max_menu_width = 100;
--   documentation = true;

--   source = {
--     path = true;
--     buffer = true;
--     calc = true;
--     nvim_lsp = true;
--     nvim_lua = true;
--     vsnip = true;
--   };
-- }

-- -- TELESCOPE
-- require('telescope').setup {
--   defaults = {
--     file_ignore_patterns = { "node_modules", ".git/*" }
--   }
-- }

-- -- EMMET
-- -- How to do this through Lua?
-- -- cmd 'let g:user_emmet_mode=\'inv\''
-- -- cmd 'let g:user_emmet_install_global = 0'
-- -- cmd 'autocmd FileType html,css,typescriptreact EmmetInstall'
-- -- g['user_emmet_leader_key'] = '<C-e>'
