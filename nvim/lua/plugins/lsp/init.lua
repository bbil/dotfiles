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

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      { 'L3MON4D3/LuaSnip' },
    },
    config = function()
      local cmp = require('cmp')

      cmp.setup({
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<CR>'] = cmp.mapping.confirm({select = false}),
        })
      })
    end
  },

  -- non-Mason LSPs
  {
    'elixir-tools/elixir-tools.nvim',
    ft = 'elixir',
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      local elixir = require("elixir")

      elixir.setup({
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        on_attach = function(client, buffer)
          require('plugins.lsp.keymaps').on_attach(client, buffer)
        end,
      })
    end
  },
}

