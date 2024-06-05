return {
  {
    'echasnovski/mini.nvim',
    version = '*',
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require('mini.animate').setup()
      require('mini.bufremove').setup()
      require('mini.cursorword').setup()
      require('mini.indentscope').setup()
      require('mini.move').setup()

      require('mini.surround').setup({
        mappings = {
          add = 'sa', -- Add surrounding in Normal and Visual modes
          delete = 'ysd', -- Delete surrounding
          find = 'ysf', -- Find surrounding (to the right)
          find_left = 'ysF', -- Find surrounding (to the left)
          highlight = 'ysh', -- Highlight surrounding
          replace = 'ysr', -- Replace surrounding
          update_n_lines = 'ysn', -- Update `n_lines`

          suffix_last = 'l', -- Suffix to search with "prev" method
          suffix_next = 'n', -- Suffix to search with "next" method
        },
      })

      local files = require('mini.files')
      files.setup()

      -- { "<leader>tt", mode = 'n', ':NvimTreeToggle<cr>', desc = '[T]ree toggle', silent = true, noremap = true },
      -- { "<leader>tf", mode = 'n', ':NvimTreeFindFile<cr>', desc = '[T] [F]ind file', silent = true, noremap = true },

      vim.keymap.set('n', '<leader>tt', files.open, { desc = '[T]ree open' })

      require('mini.pairs').setup()

      -- local notify = require('mini.notify')
      --
      -- notify.setup()
      --
      -- vim.notify = notify.make_notify({
      --   ERROR = { duration = 5000 },
      --   WARN = { duration = 3000 },
      --   INFO = { duration = 4000 },
      -- })
    end
  },
}
