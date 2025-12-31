local M = {}

local function disable_netrw()
  -- Disable netrw (default tree)
  vim.g.loaded_netrw       = 1
  vim.g.loaded_netrwPlugin = 1
end

local function editor_ui()
  vim.opt.wrap          = false

  vim.opt.cursorline    = true

  vim.opt.hlsearch      = false
  vim.opt.incsearch     = true
  vim.opt.number        = true

  -- keep characters at top/bottom of screen when scrolling
  vim.opt.scrolloff     = 16

  vim.opt.mouse         = 'a'

  vim.opt.breakindent   = true

  vim.opt.termguicolors = true

  -- make splits feel more natural
  vim.opt.splitright    = true
  vim.opt.splitbelow    = true

  vim.opt.fillchars = {
    fold = ' '
  }
end

local function whitespace_rendering()
  -- showing whitespace
  vim.opt.list = false

  -- Customize the characters used
  vim.opt.listchars = {
    lead = '·',
    tab = '» ',
    trail = '·',
    extends = '>',
    precedes = '<'
  }

  vim.api.nvim_create_user_command(
    'WhitespaceToggle',
    function()
      vim.wo.list = not vim.wo.list
    end,
    {}
  )
end

local function editor_experience()
  -- Save undo history
  vim.opt.undofile    = true

  -- Case-insensitive searching UNLESS \C or capital in search
  vim.opt.ignorecase  = true
  vim.opt.smartcase   = true

  -- Keep signcolumn on by default
  vim.opt.signcolumn  = 'yes'

  -- Decrease update time
  vim.opt.updatetime  = 250
  vim.opt.timeout     = true
  vim.opt.timeoutlen  = 300

  -- Set completeopt to have a better completion experience
  vim.opt.completeopt = 'menuone,noselect'
end

-- Fold using TreeSitter; fallback to indent with :ToggleFoldMethod
local function folds()
  local core_folds = require('core.folds')

  core_folds.fold_defaults()
  core_folds.create_autocommand_lsp()
end

local function diagnostics()
  local severity = vim.diagnostic.severity

  vim.diagnostic.config({
    signs = {
      text = {
        [severity.ERROR] = ' ',
        [severity.WARN] = ' ',
        [severity.HINT] = '󰠠 ',
        [severity.INFO] = ' ',
      },
    },
  })
end

function M.setup()
  disable_netrw()
  editor_ui()
  whitespace_rendering()
  editor_experience()
  folds()
  diagnostics()
end

return M
