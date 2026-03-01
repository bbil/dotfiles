-- Setup Autocmd for all filetypes for the parsers in required_parsers
-- This works because nvim-treesitter has already registered the parser to filetypes with vim.treesitter.language.register()
--   It's for this reason we have this in the after/ directory
--   This registration happens in the plugin/ directory of that package, so I have no way to force it to execute earlier for me
--   And it sets up this globabl state I need for get_filetypes
-- note: foldexpr is already set in 'core.folds', not via this autocmd
--
local required_parsers = require('plugins.treesitter').required_parsers

for _, parser in ipairs(required_parsers) do
  local file_types = vim.treesitter.language.get_filetypes(parser)

  vim.api.nvim_create_autocmd("FileType", {
    pattern = file_types,
    callback = function()
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      vim.treesitter.start()
    end,
  })
end
