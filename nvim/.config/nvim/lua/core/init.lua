local M = {}

function M.setup()
  require('core.opts').setup()
  require('core.keymaps').setup()
end

return M
