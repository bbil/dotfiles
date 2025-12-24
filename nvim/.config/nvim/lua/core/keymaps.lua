-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`

-- Easier Esc
vim.keymap.set('i', 'jj', '<Esc>')

-- TODO: What does this do. I have leader set to space, so does this do nothing?
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Jump around page, but keep cursor in center of screen
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Remap C-e/y to do paragraph jump, i.e. { or }, but disable jump list
vim.keymap.set('n', '<C-e>', ':<C-u>execute "keepjumps norm! " . v:count1 . "}"<CR>', { silent = true })
vim.keymap.set('n', '<C-y>', ':<C-u>execute "keepjumps norm! " . v:count1 . "{"<CR>', { silent = true })

-- Keep cursor in middle when navigating search terms
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- yank relative filepath to system clipboard
vim.keymap.set('n', '<leader>fy', '<cmd>let @+ = expand("%")<cr>')

-- Convenience mappings to yank to system clipboard register
vim.keymap.set('n', '<leader>y', '\"+y')
vim.keymap.set('n', '<leader>Y', '\"+y')
vim.keymap.set('v', '<leader>y', '\"+y')

-- Convenience mappings to paste from system clipboard register
vim.keymap.set('n', '<leader>p', '\"+p')
vim.keymap.set('n', '<leader>P', '\"+P')

-- Delete to the void register
vim.keymap.set('n', '<leader>d', '\"_d')
vim.keymap.set('v', '<leader>d', '\"_d')

-- Tab navigation
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', { desc = '[N]ext' })
vim.keymap.set('n', '<leader>tp', ':tabN<CR>', { desc = '[P]rev' })
vim.keymap.set('n', '<leader>td', ':tabd<CR>', { desc = '[D]elete' })

for i = 1, 9 do
  vim.keymap.set('n', '<leader>t' .. i, i .. 'gt', { desc = tostring(i) })
end

-- Buffers
vim.keymap.set('n', '<leader>bn', ':bn<CR>', { desc = '[N]ext' })
vim.keymap.set('n', '<leader>bp', ':bp<CR>', { desc = '[P]rev' })
vim.keymap.set('n', '<leader>bd', ':bd<CR>', { desc = '[D]elete' })
vim.keymap.set('n', '<leader>bo', ':BufOnly<CR>', { desc = '[D]elete all' })


-- Quick Fix
vim.keymap.set('n', '<leader>co', ':copen<CR>', { desc = 'Open' })
vim.keymap.set('n', '<leader>cc', ':cclose<CR>', { desc = 'Open' })
vim.keymap.set('n', '<leader>cn', ':cn<CR>', { desc = 'Next' })
vim.keymap.set('n', '<leader>cp', ':cp<CR>', { desc = 'Previous' })
vim.keymap.set('n', '<leader>cN', ':colder<CR>', { desc = 'Older' })
vim.keymap.set('n', '<leader>cP', ':cnewer<CR>', { desc = 'newer' })
vim.keymap.set('n', '[c', ':cp<CR>', { desc = ':cprevious' })
vim.keymap.set('n', ']c', ':cn<CR>', { desc = ':cnext' })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

