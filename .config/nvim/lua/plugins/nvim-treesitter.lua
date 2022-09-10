require('nvim-treesitter.configs').setup({
  ensure_installed = 'all',
  highlight = {
    enable = true,
    disable = { '' },
    use_languagetree = true,
  },
  indent = {
    enable = true,
    disable = { 'yaml' },
  },
})
