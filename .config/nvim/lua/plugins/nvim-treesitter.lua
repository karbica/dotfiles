require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true
  },
  ensure_installed = 'maintained',
})
