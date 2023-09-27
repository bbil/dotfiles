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
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        -- component_separators = '|',
        -- section_separators = '',
        disabled_filetypes = { 'NvimTree' },
      },
      sections = {
        lualine_c = { 'buffers' },
        lualine_y = { 'filetype' },
      },
      winbar = {
        lualine_a = {
          {
            'filename',
            path = 1,
            shorting_target = 20,
          },
        }
      },
    },
  },
}

