local M = {}

_G.my_ui = _G.my_ui or {}

-- Global function to b used in foldtext
function _G.my_ui.pretty_foldtext()
  local line = vim.fn.getline(vim.v.foldstart)
  local indent = line:match('^%s*') or ''
  local content = line:gsub('^%s*', '')

  local lines = vim.v.foldend - vim.v.foldstart + 1

  local prefix = ' '
  local suffix = (' 󰐗 %d'):format(lines)

  return indent .. prefix .. content .. suffix
end

local function force_fold_reevaluate()
  vim.schedule(function() vim.cmd('normal! zx') end)
end

local function fold_lsp_on_win()
  vim.wo.foldmethod = 'expr'
  vim.wo.foldexpr = 'v:lua.vim.lsp.foldexpr()'
  vim.wo.foldlevel = 99

  force_fold_reevaluate()
end

local function fold_treesitter_on_win()
  vim.wo.foldmethod = 'expr'
  vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
  vim.wo.foldlevel = 99

  force_fold_reevaluate()
end

local function fold_indent_on_win()
  vim.wo.foldmethod = 'indent'
  vim.wo.foldexpr = ''
  vim.wo.foldlevel = 99

  force_fold_reevaluate()
end

local function fold_km(cmd, fn, desc)
  vim.keymap.set('n', cmd, fn, { desc = 'Fold: ' .. desc})
end

-- convenience keymappings to force how folds are done
function M.fold_method_keymaps()
  fold_km('<leader>zl', fold_lsp_on_win, 'LSP')
  fold_km('<leader>zt', fold_treesitter_on_win, 'Treesitter')
  fold_km('<leader>zi', fold_indent_on_win, 'Indent' )
end

function M.fold_defaults()
  vim.opt.foldcolumn = '0'
  vim.opt.foldmethod = 'expr'
  vim.opt.foldexpr   = 'v:lua.vim.treesitter.foldexpr()'
  vim.opt.foldenable = false
  vim.opt.foldlevel  = 99
  vim.opt.foldtext   = 'v:lua.my_ui.pretty_foldtext()'
end

-- Set folds to lsp if the LSP supports 'textDocument/foldingRange'
function M.create_autocommand_lsp()
  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('FoldGroup', { clear = true }),
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client == nil then
        return
      end

      if client:supports_method('textDocument/foldingRange') then
        fold_lsp_on_win()
      end
    end
  })
end

return M
