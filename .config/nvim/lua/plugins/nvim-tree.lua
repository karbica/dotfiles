vim.g.nvim_tree_icons = {
  default = '●',
  folder = {
    default = '',
    arrow_open = '-',
    arrow_closed = '+',
    open = '',
    empty = '',
    empty_open = '',
  },
}

require('nvim-tree').setup({
  auto_close = false,
  view = {
    width = 50,
    side = 'left',
    auto_resize = true,
  },
})
