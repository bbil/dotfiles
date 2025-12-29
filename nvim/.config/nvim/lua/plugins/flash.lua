vim.pack.add({ 'https://github.com/folke/flash.nvim.git' })

local M = {}

function M.setup()
  local flash = require('flash')
  local km = vim.keymap

  flash.setup({
    search = {
      multi_window = true,
    },
    modes = {
      -- disable f/t/F/T override
      char = {
        enabled = false,
      },
    },
  })

  km.set({ 'n', 'o', 'x' }, 's', function() flash.jump() end, { desc = "Flash" })
  km.set({ 'n', 'o', 'x' }, 'S', function() flash.treesitter() end, { desc = "Flash Treesitter" })
  km.set('o', 'r', function() flash.remote() end, { desc = "Remote Flash" })
  km.set({ 'o', 'x' }, 'R', function() flash.treesitter_search() end, { desc = "Treesitter Search" })
  km.set('c', '<C-s>', function() flash.toggle() end, { desc = "Toggle Flash Search" })
end

return M
