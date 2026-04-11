-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('core').setup()

vim.api.nvim_create_user_command('PackUpdate', function() vim.pack.update() end, { desc = 'Update packages' })
