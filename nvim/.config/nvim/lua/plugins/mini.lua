vim.pack.add({ 'https://github.com/echasnovski/mini.nvim.git' })

local M = {}

function M.setup()
  require('mini.bracketed').setup()
  require('mini.bufremove').setup()
  require('mini.cursorword').setup()
  require('mini.icons').setup()
  require('mini.indentscope').setup()
  require('mini.move').setup()
  require('mini.pairs').setup()
  require('mini.surround').setup()

  -- Have mini.icons mimic another icon provider
  -- So that other plugins with integration with it can use mini.icons
  MiniIcons.mock_nvim_web_devicons()
end

return M
