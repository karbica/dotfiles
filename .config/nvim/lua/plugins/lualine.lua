require('lualine').setup({
  options = {
    section_separators = { left = '', right = '' },
    component_separators = { left = '⦁', right = '⦁'},
    theme = 'github_dark_default',
    icons_enabled=false
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename', {'diagnostics', sources={'nvim_diagnostic'}}},
    lualine_x = {'encoding', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  }
})
