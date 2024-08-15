return {
  -- Minimap
  {
    'gorbit99/codewindow.nvim',
    config = function()
      local codewindow = require('codewindow')
      codewindow.setup()
      codewindow.apply_default_keybinds()

      local wk = require('which-key')

      wk.add({
        {'<leader>m', group = 'minimap'}
      })
      -- default keybindings are fine
      -- <leader>mo - open the minimap
      -- <leader>mc - close the minimap
      -- <leader>mf - focus/unfocus the minimap
      -- <leader>mm - toggle the minimap
    end,
  },
}

