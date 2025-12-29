vim.pack.add({
  'https://github.com/rhysd/git-messenger.vim.git',
  'https://github.com/lewis6991/gitsigns.nvim.git',
})

local M = {}

function M.setup()
  require('gitsigns').setup({
    on_attach = function(bufnr)
      local gs = require('gitsigns')

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']h', function()
        if vim.wo.diff then return ']h' end
        vim.schedule(function() gs.next_hunk() end)
        return '<Ignore>'
      end, { expr = true })

      map('n', '[h', function()
        if vim.wo.diff then return '[h' end
        vim.schedule(function() gs.prev_hunk() end)
        return '<Ignore>'
      end, { expr = true })

      -- Actions
      map('n', '<leader>gp', gs.preview_hunk, { desc = "Preview Hunk" })
      map('n', '<leader>gb', function() gs.blame_line { full = true } end, { desc = "Blame Line" })
      map('n', '<leader>gtb', gs.toggle_current_line_blame, { desc = "Git blame Line" })
      map('n', '<leader>gd', gs.diffthis, { desc = "Diff" })
      map('n', '<leader>gD', function() gs.diffthis('~') end, { desc = "Diff (with ~)" })
      map('n', '<leader>gtd', gs.toggle_deleted, { desc = "Git deleted lines" })

      -- Text object
      map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end,
  })
end

return M

