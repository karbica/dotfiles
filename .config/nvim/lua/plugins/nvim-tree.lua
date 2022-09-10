--[[ vim.g.nvim_tree_indent_markers = 1

vim.g.nvim_tree_window_picker_exclude = {
  filetype = {
    'notify',
    'packer',
  },
}

vim.g.nvim_tree_show_icons = {
  folders = 1,
} ]]

vim.g.nvim_tree_icons = {
  default = '●',
  git = {
    ignored = '●',
  },
  folder = {
    default = '',
    arrow_open = '-',
    arrow_closed = '+',
    open = '',
    empty = '',
    empty_open = '',
    symlink = '',
    symlink_open = '',
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
