-- common dependencies here
vim.pack.add({
  'https://github.com/nvim-lua/plenary.nvim.git',
})

-- simple plugins that don't need config
vim.pack.add({
  'https://github.com/tpope/vim-sleuth.git',
  'https://github.com/sitiom/nvim-numbertoggle.git',
  'https://github.com/christoomey/vim-tmux-navigator.git',
  'https://github.com/numtostr/BufOnly.nvim.git',
})

require('plugins.mini')

require('plugins.snacks')
require('plugins.snacks-picker')

require('plugins.which-key')
require('plugins.file-nav')
require('plugins.git')
require('plugins.ui')
require('plugins.flash')

-- User command to update packages
vim.api.nvim_create_user_command(
  'PackUpdate', 
  function()
    vim.pack.update()
  end,
  {desc = 'Update packages'}
)

