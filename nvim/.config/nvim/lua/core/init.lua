local M = {}

function M.setup()
  require('core.opts').setup()
  require('core.keymaps').setup()
  require('core.autocommands').setup()
end

return M
