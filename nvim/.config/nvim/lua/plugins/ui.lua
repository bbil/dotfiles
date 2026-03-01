vim.pack.add({
  'https://github.com/levouh/tint.nvim.git',
  -- below here is colorschemes
  'https://github.com/folke/tokyonight.nvim.git',
  { src = 'https://github.com/catppuccin/nvim.git', name = 'catppuccin' },
})

local M = {}

local function setup_tint()
  require('tint').setup({
    tint = -15,                                                 -- Darken colors, use a positive value to brighten
    saturation = 0.7,                                           -- Saturation to preserve
    transforms = require("tint").transforms.SATURATE_TINT,      -- Showing default behavior, but value here can be predefined set of transforms
    tint_background_colors = true,                              -- Tint background portions of highlight groups
    highlight_ignore_patterns = { "WinSeparator", "Status.*" }, -- Highlight group patterns to ignore, see `string.find`
    window_ignore_function = function(winid)
      local bufid = vim.api.nvim_win_get_buf(winid)
      local buftype = vim.api.nvim_get_option_value('buftype', { buf = bufid })
      local floating = vim.api.nvim_win_get_config(winid).relative ~= ""

      -- Do not tint `terminal` or floating windows, tint everything else
      return buftype == "terminal" or buftype == "nofile" or floating
    end
  })
end

local function default_colorscheme()
  vim.cmd.colorscheme('tokyonight-moon')
end

function M.setup()
  setup_tint()
  default_colorscheme()
end

return M
