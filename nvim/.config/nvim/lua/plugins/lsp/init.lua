return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim'
    },
    config = function()
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        require('plugins.lsp.keymaps').on_attach(client, bufnr)
      end)

      require('mason').setup({})
      require('mason-lspconfig').setup({
        -- Replace the language servers listed here
        -- with the ones you want to install
        ensure_installed = { 'tsserver', 'rust_analyzer', 'lua_ls' },
        handlers = {
          lsp_zero.default_setup,
        },
      })
    end
  },

  -- LSP Support
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
    },
  },

  -- non-Mason LSPs
  {
    'elixir-tools/elixir-tools.nvim',
    -- ft = 'elixir',
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      local elixir = require("elixir")

      elixir.setup({
        -- capabilities = require("cmp_nvim_lsp").default_capabilities(),
        nextls = {
          enable = false,
          -- capabilities = require("cmp_nvim_lsp").default_capabilities(),
          on_attach = function(client, buffer)
            require('plugins.lsp.keymaps').on_attach(client, buffer)
          end
        },
        elixirls = {
          enable = true,
          on_attach = function(client, buffer)
            require('plugins.lsp.keymaps').on_attach(client, buffer)
          end,
        }
      })
    end
  },

  -- Helper to make signature help stay visible
  {
    'ray-x/lsp_signature.nvim',
    event = 'VeryLazy',
    main = 'lsp_signature',
    opts = {
      floating_window = true,
      bind = true,
      handler_opts = {
        border = 'rounded',
      },
    },
    config = true,
  }
}
