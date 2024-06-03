return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = false,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        treesitter_context = true,
        notify = true,
        mini = false,
        harpoon = true,
        mason = true,
      }
    },
    config = function(_, opts)
      require('catppuccin').setup(opts)
      vim.cmd.colorscheme('catppuccin-macchiato')
    end
  },

  -- alternate colorschemes use :Telescope colorscheme to switch
  'shaunsingh/solarized.nvim',
  'navarasu/onedark.nvim', -- config = function() require('onedark').setup({ style = 'darker' }) vim.cmd.colorscheme('onedark') end },

  {
    'levouh/tint.nvim',
    config = function(_, _)
      require('tint').setup({
        tint = -15,                                                 -- Darken colors, use a positive value to brighten
        saturation = 0.7,                                           -- Saturation to preserve
        transforms = require("tint").transforms.SATURATE_TINT,      -- Showing default behavior, but value here can be predefined set of transforms
        tint_background_colors = true,                              -- Tint background portions of highlight groups
        highlight_ignore_patterns = { "WinSeparator", "Status.*" }, -- Highlight group patterns to ignore, see `string.find`
        window_ignore_function = function(winid)
          local bufid = vim.api.nvim_win_get_buf(winid)
          local buftype = vim.api.nvim_buf_get_option(bufid, "buftype")
          local floating = vim.api.nvim_win_get_config(winid).relative ~= ""

          -- Do not tint `terminal` or floating windows, tint everything else
          return buftype == "terminal" or buftype == "nofile" or floating
        end
      })
    end
  },
}

