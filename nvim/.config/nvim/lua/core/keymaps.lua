local M = {}
local km = vim.keymap

local function basic()
  -- Easier Esc
  km.set('i', 'jj', '<Esc>')

  -- TODO: What does this do. I have leader set to space, so does this do nothing?
  km.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

  km.set("n", "<leader>:", ":lua ", { noremap = true })
end

local function keep_things_centered()
  km.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
  km.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

  km.set('n', '<C-d>', '<C-d>zz')
  km.set('n', '<C-u>', '<C-u>zz')

  -- Keep cursor in middle when navigating search terms
  km.set('n', 'n', 'nzzzv')
  km.set('n', 'N', 'Nzzzv')
end


local function clipboard_management()
  -- yank relative filepath to system clipboard
  km.set('n', '<leader>fy', '<cmd>let @+ = expand("%")<cr>')

  -- Convenience mappings to yank to system clipboard register
  km.set('n', '<leader>y', '\"+y')
  km.set('n', '<leader>Y', '\"+y')
  km.set('v', '<leader>y', '\"+y')

  -- Convenience mappings to paste from system clipboard register
  km.set('n', '<leader>p', '\"+p')
  km.set('n', '<leader>P', '\"+P')

  -- Delete to the void register
  km.set('n', '<leader>d', '\"_d')
  km.set('v', '<leader>d', '\"_d')

  -- See `:help vim.highlight.on_yank()`
  local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
  vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
      vim.hl.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
  })
end

local function paragraph_jumping()
  -- Remap C-e/y to do paragraph jump, i.e. { or }, but disable jump list
  km.set('n', '<C-e>', ':<C-u>execute "keepjumps norm! " . v:count1 . "}"<CR>', { silent = true })
  km.set('n', '<C-y>', ':<C-u>execute "keepjumps norm! " . v:count1 . "{"<CR>', { silent = true })
end

local function tab_buffer_quickfix()
  -- Tab navigation
  km.set('n', '<leader>tn', ':tabn<CR>', { desc = '[N]ext' })
  km.set('n', '<leader>tp', ':tabN<CR>', { desc = '[P]rev' })
  km.set('n', '<leader>td', ':tabd<CR>', { desc = '[D]elete' })

  -- Buffers
  km.set('n', '<leader>bn', ':bn<CR>', { desc = '[N]ext' })
  km.set('n', '<leader>bp', ':bp<CR>', { desc = '[P]rev' })
  km.set('n', '<leader>bd', ':bd<CR>', { desc = '[D]elete' })
  km.set('n', '<leader>bo', ':BufOnly<CR>', { desc = '[D]elete all' })

  -- Quick Fix
  km.set('n', '<leader>qo', ':copen<CR>', { desc = 'Open' })
  km.set('n', '<leader>qc', ':cclose<CR>', { desc = 'Open' })
  km.set('n', '<leader>qn', ':cn<CR>', { desc = 'Next' })
  km.set('n', '<leader>qp', ':cp<CR>', { desc = 'Previous' })
  km.set('n', '<leader>qN', ':colder<CR>', { desc = 'Older' })
  km.set('n', '<leader>qP', ':cnewer<CR>', { desc = 'newer' })
end

local function diagnostics()
  km.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
  km.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
end

function M.setup()
  basic()
  keep_things_centered()
  clipboard_management()
  paragraph_jumping()
  tab_buffer_quickfix()
  diagnostics()
end

return M
