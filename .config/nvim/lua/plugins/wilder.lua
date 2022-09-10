local wilder = require('wilder')

wilder.setup({
  mode = {':', '/', '?'}
})

wilder.set_option('renderer', wilder.popupmenu_renderer({
  highlighter = wilder.basic_highlighter(),
  right = { ' ', wilder.popupmenu_scrollbar()},
}))
