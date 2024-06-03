return {
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = true,
        theme = 'catppuccin',
        -- comment separators to get back Powerline font style
        component_separators = '|',
        section_separators = '',
        disabled_filetypes = { 'NvimTree' },
      },
      sections = {
        lualine_c = {
          {
            'filename',
            path = 1,
            shorting_target = 20,
          },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
    },
  },
}
