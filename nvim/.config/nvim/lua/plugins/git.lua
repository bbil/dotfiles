return {
  'rhysd/git-messenger.vim', -- <leader>gm
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'sindrets/diffview.nvim',
      'ibhagwan/fzf-lua',
    },
    config = true
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
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
        map('n', '<leader>gs', gs.stage_hunk, { desc = "Stage Hunk" })
        map('n', '<leader>gr', gs.reset_hunk, { desc = "Reset Hunk" })
        map('v', '<leader>gs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
        map('v', '<leader>gr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
        map('n', '<leader>gu', gs.undo_stage_hunk, { desc = "Undo Stage" })
        map('n', '<leader>gp', gs.preview_hunk, { desc = "Preview Hunk" })
        map('n', '<leader>gb', function() gs.blame_line { full = true } end, { desc = "Blame Line" })
        map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = "Git blame Line" })
        map('n', '<leader>gd', gs.diffthis, { desc = "Diff" })
        map('n', '<leader>gD', function() gs.diffthis('~') end, { desc = "Diff (with ~)" })
        map('n', '<leader>td', gs.toggle_deleted, { desc = "Git deleted lines" })

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
      end,
    },
  },
}
