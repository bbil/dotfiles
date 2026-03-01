vim.pack.add({
  { src = 'https://github.com/ThePrimeagen/harpoon.git', version = 'harpoon2' },
  'https://github.com/stevearc/oil.nvim.git',
  'https://github.com/xorid/swap-split.nvim.git'
})

local M = {}

local function setup_swap_split()
  vim.keymap.set('n', '<C-w>x', '<CMD>SwapSplit<CR>', { desc = "swap" })
  -- Set color of Picker to match default picker of NvimTree
  -- vim.api.nvim_command('hi SwapSplitStatusLine guifg=#ededed guibg=#4493c8 gui=bold ctermfg=White ctermbg=Cyan')
end

local harpoon = require('harpoon')
local extensions = require('harpoon.extensions')

local function hmap(keys, func, desc)
  if desc then
    desc = 'Harpoon: ' .. desc
  end

  vim.keymap.set('n', keys, func, { desc = desc })
end

local function create_nav_function(index)
  return function()
    harpoon:list():select(index)
  end
end

local function setup_harpoon_keymaps()
  hmap('<leader>hu', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, 'UI')
  hmap('<leader>hh', function() harpoon:list():add() end, 'Mark')

  local nav_funcs = {}
  for i = 1, 5 do
    nav_funcs[i] = create_nav_function(i)
  end

  hmap('<A-a>', nav_funcs[1], "Nav 1")
  hmap('<A-s>', nav_funcs[2], "Nav 2")
  hmap('<A-d>', nav_funcs[3], "Nav 3")
  hmap('<A-f>', nav_funcs[4], "Nav 4")
  hmap('<leader>ha', nav_funcs[1], 'Nav 1')
  hmap('<leader>hs', nav_funcs[2], 'Nav 2')
  hmap('<leader>hd', nav_funcs[3], 'Nav 3')
  hmap('<leader>hf', nav_funcs[4], 'Nav 4')
  hmap('<leader>hg', nav_funcs[5], 'Nav 5')

  hmap('<leader>hp', function() harpoon:list():prev() end, 'Prev')
  hmap('<leader>hn', function() harpoon:list():next() end, 'Next')
end

local function setup_harpoon_extensions()
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
end

local function setup_harpoon()
  harpoon:setup()

  setup_harpoon_keymaps()
  setup_harpoon_extensions()
end

local function setup_oil()
  require('oil').setup()
  vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = "Oil" })
end

function M.setup()
  setup_swap_split()
  setup_harpoon()
  setup_oil()
end

return M
