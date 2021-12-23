require('lualine').setup {
  options = {
    section_separators = {'', ''},
    component_separators = {'⦁', '⦁'},
    theme = 'github',
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
}
