-- Disable netrw (default tree)
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

-- Turn off wrap by default
vim.opt.wrap = false

-- Highlight current line
vim.opt.cursorline       = true

-- Set highlight on search
vim.opt.hlsearch         = false
vim.opt.incsearch        = true

-- Make line numbers default
-- Relative number is being set automatically by nvim-numbertoggle
vim.opt.number           = true
-- vim.opt.relativenumber = true

-- keep characters at top/bottom of screen when scrolling
vim.opt.scrolloff        = 16

-- Enable mouse mode
vim.opt.mouse            = 'a'

-- Enable break indent
vim.opt.breakindent      = true

-- Save undo history
vim.opt.undofile         = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase       = true
vim.opt.smartcase        = true

-- Keep signcolumn on by default
vim.opt.signcolumn       = 'yes'

-- Decrease update time
vim.opt.updatetime       = 250
vim.opt.timeout          = true
vim.opt.timeoutlen       = 300

-- Set completeopt to have a better completion experience
vim.opt.completeopt      = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.opt.termguicolors    = true

-- Fold using TreeSitter; fallback to indent with :ToggleFoldMethod
vim.opt.foldmethod = "expr"
vim.opt.foldexpr   = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldenable = false

vim.api.nvim_create_user_command('ToggleFoldMethod', function()
  if vim.wo.foldmethod == "expr" then
    vim.wo.foldmethod = "indent"
    print("Folding: Switched to Indent")
  else
    vim.wo.foldmethod = "expr"
    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    print("Folding: Switched to Treesitter")
  end

  -- Force Neovim to re-evaluate folds
  vim.schedule(function()
    vim.cmd("normal! zx")
  end)
end, {})
