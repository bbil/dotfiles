vim.pack.add({ 'https://github.com/folke/which-key.nvim' })

local M = {}

function M.setup()
  local wk = require('which-key')

  vim.keymap.set(
    'n',
    '<leader>?',
    function()
      wk.show({ global = false })
    end,
    { desc = "Buffer Local Keymaps (which-key)" }
  )

  wk.add({
    { '<leader>t', group = 'tab' },
    { '<leader>b', group = 'buffer' },
    { '<leader>q', group = 'quickfix' },
    { '<leader>h', group = 'harpoon' },
  })
end

return M
