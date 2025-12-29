vim.pack.add({
  { src = 'https://github.com/ThePrimeagen/harpoon.git', version = 'harpoon2' },
  'https://github.com/stevearc/oil.nvim.git',
  'https://github.com/xorid/swap-split.nvim.git'
})

-- Set color of Picker to match default picker of NvimTree
vim.keymap.set('n', '<C-w>x', '<CMD>SwapSplit<CR>', { desc = "swap" })
vim.api.nvim_command('hi SwapSplitStatusLine guifg=#ededed guibg=#4493c8 gui=bold ctermfg=White ctermbg=Cyan')

local harpoon = require('harpoon')
local extensions = require('harpoon.extensions')
harpoon:setup()

local function harpoonmap(keys, func, desc)
  if desc then
    desc = 'Harpoon: ' .. desc
  end

  vim.keymap.set('n', keys, func, { desc = desc })
end

harpoonmap('<leader>hu', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, 'UI')
harpoonmap('<leader>hh', function() harpoon:list():add() end, 'Mark')

local function create_nav_function(index)
  return function()
    harpoon:list():select(index)
  end
end

local nav_funcs = {}
for i = 1, 5 do
  nav_funcs[i] = create_nav_function(i)
end

harpoonmap('<A-a>', nav_funcs[1], "Nav 1")
harpoonmap('<A-s>', nav_funcs[2], "Nav 2")
harpoonmap('<A-d>', nav_funcs[3], "Nav 3")
harpoonmap('<A-f>', nav_funcs[4], "Nav 4")
harpoonmap('<leader>ha', nav_funcs[1], 'Nav 1')
harpoonmap('<leader>hs', nav_funcs[2], 'Nav 2')
harpoonmap('<leader>hd', nav_funcs[3], 'Nav 3')
harpoonmap('<leader>hf', nav_funcs[4], 'Nav 4')
harpoonmap('<leader>hg', nav_funcs[5], 'Nav 5')

harpoonmap('<leader>hp', function() harpoon:list():prev() end, 'Prev')
harpoonmap('<leader>hn', function() harpoon:list():next() end, 'Next')

harpoon:extend(extensions.builtins.navigate_with_number())
harpoon:extend({
  UI_CREATE = function(cx)
    vim.keymap.set("n", "<C-v>", function()
      harpoon.ui:select_menu_item({ vsplit = true })
    end, { buffer = cx.bufnr })

    vim.keymap.set("n", "<C-x>", function()
      harpoon.ui:select_menu_item({ split = true })
    end, { buffer = cx.bufnr })

    vim.keymap.set("n", "<C-t>", function()
      harpoon.ui:select_menu_item({ tabedit = true })
    end, { buffer = cx.bufnr })
  end,
})

require('oil').setup()

vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = "Oil" })
