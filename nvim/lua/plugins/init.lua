return {

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Automatically toggle relative line number
  'sitiom/nvim-numbertoggle',

  -- Vim + Tmux navigation integration
  { 'christoomey/vim-tmux-navigator', lazy = false },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',  opts = {} },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = {
      show_trailing_blankline_indent = false,
    },
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Delete all unmodified buffers
  { 'numtostr/BufOnly.nvim', cmd = 'BufOnly' },

  {
    'folke/flash.nvim',
    opts = {
      search = {
        multi_window = true,
        mode = function(str)
          return "\\<" .. str
        end,
      }
    },
    keys = {
      { "s", mode = { "n", "o", "x" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
}
