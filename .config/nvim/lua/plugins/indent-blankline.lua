vim.g.indent_blankline_filetype_exclude = { 'help', 'packer', 'man' }
vim.g.indent_blankline_buftype_exclude = { 'terminal' }
vim.g.indentLine_indentLevel = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#282b31 gui=nocombine]]

require("indent_blankline").setup({
  show_trailing_blankline_indent = false,
  show_end_of_line = true,
  char = "❘",
  char_highlight_list = {
    "IndentBlanklineIndent1",
  },
})

