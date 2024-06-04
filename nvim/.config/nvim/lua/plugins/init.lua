return {

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Automatically toggle relative line number
  'sitiom/nvim-numbertoggle',

  -- Vim + Tmux navigation integration
  { 'christoomey/vim-tmux-navigator', lazy = false },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',           opts = {} },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim',          opts = {} },

  -- Delete all unmodified buffers
  { 'numtostr/BufOnly.nvim',          cmd = 'BufOnly' },

  {
    'folke/flash.nvim',
    opts = {
      search = {
        multi_window = true,
      },
    },

    keys = {
      { "s", mode = { "n", "o", "x" }, function() require("flash").jump() end,       desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r",         mode = "o",               function() require("flash").remote() end,     desc = "Remote Flash" },
      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc = "Treesitter Search"
      },
      {
        "<c-s>",
        mode = { "c" },
        function() require("flash").toggle() end,
        desc = "Toggle Flash Search"
      },
    },
  },

  {
    'xorid/swap-split.nvim',
    opts = {
      ignore_filetypes = { 'NvimTree' }
    },
    keys = {
      -- Overwrite swap current with next keybinding
      { '<C-w>x', mode = 'n', '<cmd>SwapSplit<CR>', desc = "swap" },
    },
    config = function(_, opts)
      require('swap-split').setup(opts)

      -- Set color of Picker to match default picker of NvimTree
      vim.api.nvim_command('hi SwapSplitStatusLine guifg=#ededed guibg=#4493c8 gui=bold ctermfg=White ctermbg=Cyan')
    end
  }
}
