vim.pack.add({
  -- neovim provided configuration helpers
  'https://github.com/neovim/nvim-lspconfig.git',
  -- mason provides essentially a package manager for Language Servers
  'https://github.com/mason-org/mason.nvim.git',
  'https://github.com/mason-org/mason-lspconfig.nvim.git',
  -- decide if we need this junk
  -- Helper to make signature help stay visible
  -- 'https://github.com/ray-x/lsp_signature.nvim.git'
})

require('mason').setup()
require('mason-lspconfig').setup()

require('plugins.lsp.keymaps')

-- TBD If we need this
-- require('lsp_signature').setup({
--   floating_window = true,
--   bind = true,
--   handler_opts = {
--     border = 'rounded',
--   },
-- })

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
