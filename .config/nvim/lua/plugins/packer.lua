-- https://github.com/wbthomason/packer.nvim

vim.cmd [[packadd packer.nvim]]
local packer = require 'packer'

return packer.startup(function()

    -- packer can manage itself
    use 'wbthomason/packer.nvim'

    -- file explorer
    use 'kyazdani42/nvim-tree.lua'

    -- a customizable status line
    use 'nvim-lualine/lualine.nvim'
    
    -- convenient pairing for characters
    use 'windwp/nvim-autopairs'

    -- rich language features
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }

    -- minimal icons
    use {
      'projekt0n/circles.nvim',
      requires = {{'kyazdani42/nvim-web-devicons'}, {'kyazdani42/nvim-tree.lua', opt = true}},
    }

    -- colorschemes
    use "projekt0n/github-nvim-theme"

    -- LSP
    use 'neovim/nvim-lspconfig'

    -- commenting utility
    use 'b3nj5m1n/kommentary'

    -- customizable project search
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
    }

    -- git label indicators in the column
    use {
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
    }

end)
