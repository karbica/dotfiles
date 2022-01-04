vim.cmd [[packadd packer.nvim]]
local packer = require('packer')

return packer.startup(function()

  -- https://github.com/wbthomason/packer.nvim
  use 'wbthomason/packer.nvim'

  -- https://github.com/kyazdani42/nvim-tree.lua
  use 'kyazdani42/nvim-tree.lua'

  -- https://github.com/nvim-lualine/lualine.nvim
  use 'nvim-lualine/lualine.nvim'

  -- https://github.com/ggandor/lightspeed.nvim
  use 'ggandor/lightspeed.nvim'

  -- https://github.com/lukas-reineke/indent-blankline.nvim
  use "lukas-reineke/indent-blankline.nvim"

  -- https://github.com/windwp/nvim-autopairs
  use 'windwp/nvim-autopairs'

  -- https://github.com/gelguy/wilder.nvim
  use 'gelguy/wilder.nvim'

  -- https://github.com/nvim-treesitter/nvim-treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
  }

  -- https://github.com/projekt0n/circles.nvim
  use {
    'projekt0n/circles.nvim',
    requires = {
      { 'kyazdani42/nvim-web-devicons' },
      { 'kyazdani42/nvim-tree.lua', opt = true },
    },
  }

  -- https://github.com/projekt0n/github-nvim-theme
  use 'projekt0n/github-nvim-theme'

  -- https://github.com/neovim/nvim-lspconfig
  use 'neovim/nvim-lspconfig'

  -- https://github.com/b3nj5m1n/kommentary
  use 'b3nj5m1n/kommentary'

  -- https://github.com/nvim-telescope/telescope.nvim
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }

  -- https://github.com/lewis6991/gitsigns.nvim
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }

end)
