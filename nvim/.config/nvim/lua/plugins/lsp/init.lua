vim.pack.add({
  'https://github.com/mason-org/mason.nvim.git',     -- essentially a package manager for Language Servers
  'https://github.com/ray-x/lsp_signature.nvim.git', -- makes signature not suck as much
  'https://github.com/j-hui/fidget.nvim.git',        -- progress bar for LSP (has a Lua API for notifactions as well)
})

local M = {}

-- Enable LSPs by name, need a file `lsp/<name>.lua`
-- Which can be copy-pasted from https://github.com/neovim/nvim-lspconfig.git
-- And make whatever configuration is needed
local function enable_lsps()
  vim.lsp.enable({
    'lua_ls',
    'rust_analyzer',
  })
end

function M.setup()
  require('mason').setup()
  require('plugins.lsp.keymaps').setup()

  require('lsp_signature').setup({
    floating_window = true,
    bind = true,
    handler_opts = {
      border = 'rounded',
    },
  })

  require('fidget').setup()

  enable_lsps()
end

return M

-- return {
--   {
--     'elixir-tools/elixir-tools.nvim',
--     -- ft = 'elixir',
--     version = "*",
--     event = { "BufReadPre", "BufNewFile" },
--     dependencies = {
--       'nvim-lua/plenary.nvim',
--       'hrsh7th/cmp-nvim-lsp',
--     },
--     config = function()
--       local elixir = require("elixir")
--
--       elixir.setup({
--         -- capabilities = require("cmp_nvim_lsp").default_capabilities(),
--         nextls = {
--           enable = false,
--           -- capabilities = require("cmp_nvim_lsp").default_capabilities(),
--           on_attach = function(client, buffer)
--             require('plugins.lsp.keymaps').on_attach(client, buffer)
--           end
--         },
--         elixirls = {
--           enable = true,
--           on_attach = function(client, buffer)
--             require('plugins.lsp.keymaps').on_attach(client, buffer)
--           end,
--         }
--       })
--     end
--   },
-- }
