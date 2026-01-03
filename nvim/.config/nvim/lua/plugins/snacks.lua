vim.pack.add({ 'https://github.com/folke/snacks.nvim.git' })

-- I generally prefer mini for these small things
-- Mainly using snacks for:
--   * picker
--   * dashbaord
--   * lazygit floating window

local M = {}

function M.setup()
  require('snacks').setup({
    -- prevent LSP and Treesitter from trying to be used
    -- no reason not to have this I think
    bigfile = { enabled = true },
    dashboard = {
      -- default dashboard config other than turning off startup section crash from unmmet deps
      -- https://github.com/folke/snacks.nvim/issues/1778 (closed by bot)
      enabled = true,
      sections = {
        { section = "header" },
        { section = "keys",  gap = 1, padding = 1 },
        -- { section = "startup" },
      },
    },
    explorer = { enabled = false },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = false },
    quickfile = { enabled = false },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },

    picker = { enabled = true },
  })

  vim.keymap.set('n', '<leader>gl', function() Snacks.lazygit() end, { desc = 'lazygit' })
end

return M

