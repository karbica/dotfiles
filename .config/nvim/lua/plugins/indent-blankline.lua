vim.cmd [[highlight IndentBlanklineIndent1 guibg=NONE guifg=#494f56 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=NONE guifg=#494f56 gui=nocombine]]

vim.g.indentLine_fileTypeExclude = { 'help', 'NvimTree', 'packer' }

require("indent_blankline").setup {
  char = "🮘",
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
  },
  space_char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
  },
show_trailing_blankline_indent = false,
}
