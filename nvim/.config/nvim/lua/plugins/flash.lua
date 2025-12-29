vim.pack.add({ 'https://github.com/folke/flash.nvim.git' })

local flash = require('flash')

flash.setup({
  search = {
    multi_window = true,
  },
})

vim.keymap.set({ 'n', 'o', 'x' }, 's', function() flash.jump() end, { desc = "Flash" })
vim.keymap.set({ 'n', 'o', 'x' }, 'S', function() flash.treesitter() end, { desc = "Flash Treesitter" })
vim.keymap.set('o', 'r', function() flash.remote() end, { desc = "Remote Flash" })
vim.keymap.set({ 'o', 'x' }, 'R', function() flash.treesitter_search() end, { desc = "Treesitter Search" })
vim.keymap.set('c', '<C-s>', function() flash.toggle() end, { desc = "Toggle Flash Search" })
