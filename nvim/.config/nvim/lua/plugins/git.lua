return {
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      on_attach = function(bufnr)
        local gs = require('gitsigns')

        vim.keymap.set('n', '<leader>gp', gs.prev_hunk, { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
        vim.keymap.set('n', '<leader>gn', gs.next_hunk, { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })

        vim.keymap.set('n', '<leader>gg', gs.preview_hunk, { buffer = bufnr, desc = '[P]review hunk' })

        vim.keymap.set('n', '<leader>gb', gs.toggle_current_line_blame, { buffer = bufnr, desc = '[B]lame' })

        vim.keymap.set('n', '<leader>gs', gs.stage_hunk, { buffer = bufnr, desc = '[S]tage hunk' })
        vim.keymap.set('n', '<leader>gS', gs.undo_stage_hunk, { buffer = bufnr, desc = 'Undo [S]tage hunk' })
      end,
    },
  },
}
