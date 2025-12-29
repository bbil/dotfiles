local M = {}

function M.setup()
  local km = vim.keymap -- just an alias

  -- keybinds setup on LspAttach
  -- Note: 'K' keymap for vim.lsp.buf.hover is done automatically
  --       There are also some other default 'g'-prefixed keymaps that are aleady
  --       overwritten by snacks-picker configuration (has default behaviour if no LSP configured)
  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
      local opts = { buffer = ev.buffer, silent = true }

      opts.desc = 'Signature Help'
      km.set('n', 'gK', vim.lsp.buf.signature_help, opts)

      opts.desc = 'Code Action'
      km.set('n', '<leader>la', vim.lsp.buf.code_action, opts)

      opts.desc = 'Run Code Lens'
      km.set('n', '<leader>la', vim.lsp.codelens.run, opts)

      opts.desc = 'Rename'
      km.set('n', '<leader>lr', vim.lsp.buf.rename, opts)

      opts.desc = 'Format Document'
      km.set('n', '<leader>lf', vim.lsp.buf.format, opts)
    end
  })
end

return M
