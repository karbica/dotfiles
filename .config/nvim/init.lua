if vim.g.vscode then
  -- VSCode Extension
else
  require('settings')
  require('keymaps')
  require('colorscheme')
  require('plugins/packer')
  require('plugins/nvim-treesitter')
  require('plugins/telescope')
  require('plugins/gitsigns')
  require('plugins/indent-blankline')
  require('plugins/wilder')
  require('plugins/lualine')
  require('plugins/nvim-autopairs')
end
