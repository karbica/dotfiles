vim.cmd [[highlight IndentBlanklineIndent1 guibg=NONE guifg=#494F56 gui=nocombine]]

vim.g.indentLine_fileTypeExclude = { 'help', 'NvimTree', 'packer' }

require("indent_blankline").setup({
  show_trailing_blankline_indent = false,
  show_end_of_line = true,
  char = "❘",
  char_highlight_list = {
    "IndentBlanklineIndent1",
    -- "IndentBlanklineIndent2",
  },
  --[[ space_char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
  }, ]]
})
