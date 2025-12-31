-- common dependencies here
vim.pack.add({
  'https://github.com/nvim-lua/plenary.nvim.git',
})

-- simple plugins that don't need config or setup
vim.pack.add({
  'https://github.com/tpope/vim-sleuth.git',
  'https://github.com/sitiom/nvim-numbertoggle.git',
  'https://github.com/christoomey/vim-tmux-navigator.git',
  'https://github.com/numtostr/BufOnly.nvim.git',
})

local M = {}

local function create_pack_update_cmd()
  vim.api.nvim_create_user_command(
    'PackUpdate',
    function()
      vim.pack.update()
    end,
    { desc = 'Update packages' }
  )
end

local modules = {
  'plugins.completion',
  'plugins.file-nav',
  'plugins.flash',
  'plugins.git',
  'plugins.lsp',
  'plugins.mini',
  'plugins.snacks',
  'plugins.snacks-picker',
  'plugins.treesitter',
  'plugins.ui',
  'plugins.ui-lualine',
  'plugins.which-key',
}

function M.setup()
  create_pack_update_cmd()

  -- load all modules and call setup function
  for _, mod in ipairs(modules) do
    local ok, plugin = pcall(require, mod)
    if ok and plugin.setup then
      plugin.setup()
    else
      vim.notify("Failed to load plugin module: " .. mod, vim.log.levels.ERROR)
    end
  end
end

return M
