vim.pack.add({ 'https://github.com/folke/which-key.nvim' })

local wk = require('which-key')

wk.setup({
  preset = 'helix',
})

vim.keymap.set(
  'n',
  '<leader>?',
  function()
    wk.show({ global = false })
  end,
  { desc = "Buffer Local Keymaps (which-key)" }
)

wk.add({
  { '<leader>b', group = 'buffer' },
  { '<leader>f', group = 'find' },
  { '<leader>g', group = 'git' },
  { '<leader>h', group = 'harpoon' },
  { '<leader>l', group = 'lsp' },
  { '<leader>q', group = 'quickfix' },
  { '<leader>s', group = 'search' },
  { '<leader>sg', group = 'git' },
  { '<leader>t', group = 'tab' },
  { '<leader>z', group = 'folds' },
})
