local M = {}

---@type PluginLspKeys
M._keys = nil

---@return (LazyKeys|{has?:string})[]
function M.get()
  ---@class PluginLspKeys
  -- stylua: ignore
  M._keys = M._keys or {
    { '<leader>li', '<cmd>LspInfo<cr>' },
    { '<leader>ld', vim.diagnostic.open_float,                 desc = 'Line Diagnostics' },

    { 'gd',         '<cmd>Telescope lsp_definitions<cr>',      desc = 'Goto Definition' },
    { 'gr',         '<cmd>Telescope lsp_references<cr>',       desc = 'References' },
    { 'gD',         vim.lsp.buf.declaration,                   desc = 'Goto Declaration' },
    { 'gI',         '<cmd>Telescope lsp_implementations<cr>',  desc = 'Goto Implementation' },
    { 'gy',         '<cmd>Telescope lsp_type_definitions<cr>', desc = 'Goto Type Definition' },
    { 'K',          vim.lsp.buf.hover,                         desc = 'Hover' },
    { 'gK',         vim.lsp.buf.signature_help,                desc = 'Signature Help',      has = 'signatureHelp' },
    { '<leader>la', vim.lsp.buf.code_action,                   desc = 'Code Action',         mode = { 'n', 'v' },       has = 'codeAction' },
    { '<leader>lc', vim.lsp.codelens.run,                      desc = 'Run Code Lens',       mode = { 'n', 'v' },       has = 'codeAction' },
    { '<leader>lC', vim.lsp.codelens.refresh,                  desc = 'Refresh Code Action', mode = { 'n', 'v' },       has = 'codeAction' },
    -- { "<leader>lR", LazyVim.lsp.rename_file,                   desc = "Rename File",         mode = { "n" },            has = { "workspace/didRenameFiles", "workspace/willRenameFiles" } },
    { "<leader>lr", vim.lsp.buf.rename,                        desc = "Rename",              has = "rename" },
    -- { "<leader>lA", LazyVim.lsp.action.source,                 desc = "Source Action",       has = "codeAction" },
    { '<leader>lf', vim.lsp.buf.format,                        desc = 'Format Document',     has = 'documentFormatting' },
  }
  return M._keys
end

function M.on_attach(client, buffer)
  local Keys = require('lazy.core.handler.keys')
  local keymaps = {} ---@type table<string,LazyKeys|{has?:string}>

  for _, value in ipairs(M.get()) do
    local keys = Keys.parse(value)
    if keys.rhs == vim.NIL or keys.rhs == false then
      keymaps[keys.id] = nil
    else
      keymaps[keys.id] = keys
    end
  end

  for _, keys in pairs(keymaps) do
    if not keys.has or client.server_capabilities[keys.has .. 'Provider'] then
      local opts = Keys.opts(keys)
      ---@diagnostic disable-next-line: no-unknown
      opts.has = nil
      opts.silent = true
      opts.buffer = buffer
      vim.keymap.set(keys.mode or 'n', keys.lhs, keys.rhs, opts)
    end
  end
end

return M
