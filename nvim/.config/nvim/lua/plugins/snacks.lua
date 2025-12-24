vim.pack.add({ 'https://github.com/folke/snacks.nvim.git' })

-- I prefer mini for these small things
-- Mainly using snacks for:
--   * picker
--   * lazygit floating window

require('snacks').setup({
  bigfile = { enabled = false },
  dashboard = { enabled = false },
  explorer = { enabled = false },
  indent = { enabled = false },
  input = { enabled = false },
  notifier = { enabled = false },
  quickfile = { enabled = false },
  scope = { enabled = false },
  scroll = { enabled = false },
  statuscolumn = { enabled = false },
  words = { enabled = false },

  picker = { enabled = true },
})

vim.keymap.set('n', '<leader>gl', function() Snacks.lazygit() end, {desc = 'lazygit'})
