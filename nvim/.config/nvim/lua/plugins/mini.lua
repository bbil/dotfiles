vim.pack.add({ 'https://github.com/echasnovski/mini.nvim.git' })

require('mini.bufremove').setup()
require('mini.cursorword').setup()
require('mini.indentscope').setup()
require('mini.move').setup()
require('mini.pairs').setup()
require('mini.surround').setup()
require('mini.icons').setup()

-- Have mini.icons mimic another icon provider
-- So that other plugins with integration with it can use mini.icons
MiniIcons.mock_nvim_web_devicons()
