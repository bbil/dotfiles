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

  wk.add({ { "<leader>t", group = "tab" } })
  wk.add({ { "<leader>b", group = "buffer" } })
  wk.add({ { '<leader>c', group = 'quickfix' } })
  wk.add({ { '<leader>h', group = 'harpoon' } })
end

return M

