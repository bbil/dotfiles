vim.pack.add({
  'https://github.com/rafamadriz/friendly-snippets.git',
  { src = 'https://github.com/saghen/blink.cmp.git', version = vim.version.range('~1') },
})

local M = {}

function M.setup()
  local blink = require('blink.cmp')

  blink.setup({
    completion = {
      list = {
        selection = {
          preselect = false,
          auto_insert = false,
        }
      }
    },

    keymap = { preset = 'default' },
    appearance = {
      nerd_font_variant = 'mono'
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' }
    },
    fuzzy = { implementation = 'prefer_rust_with_warning' },
  })
end

return M
