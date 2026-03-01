vim.pack.add({
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter.git',             version = 'main' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects.git', version = 'main' },
  'https://github.com/nvim-treesitter/nvim-treesitter-context.git',
})

local M = {}

M.required_parsers = {
  'bash',
  'c',
  'cpp',
  'go',
  'html',
  'lua',
  'markdown',
  'python',
  'rust',
  'tsx',
  'typescript',
  'vim',
  'vimdoc',

  -- Elixir
  'elixir',
  'eex',
  'heex',
  'erlang',
}

local function install_ts_grammars()
  require('nvim-treesitter').install(M.required_parsers)
end

local function setup_ts_textobjects()
  require("nvim-treesitter-textobjects").setup {
    select = {
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
      -- You can choose the select mode (default is charwise 'v')
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * method: eg 'v' or 'o'
      -- and should return the mode ('v', 'V', or '<c-v>') or a table
      -- mapping query_strings to modes.
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V',  -- linewise
        -- ['@class.outer'] = '<c-v>', -- blockwise
      },
      -- If you set this to `true` (default is `false`) then any textobject is
      -- extended to include preceding or succeeding whitespace. Succeeding
      -- whitespace has priority in order to act similarly to eg the built-in
      -- `ap`.
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * selection_mode: eg 'v'
      -- and should return true of false
      include_surrounding_whitespace = false,
    },
  }
end

local function ts_textobjects_keymaps()
  local function o_map(keys, fn)
    vim.keymap.set({ 'x', 'o' }, keys, fn)
  end

  local function n_map(keys, fn)
    vim.keymap.set('n', keys, fn)
  end

  local select = require('nvim-treesitter-textobjects.select')

  o_map('af', function() select.select_textobject("@function.outer", "textobjects") end)
  o_map('if', function() select.select_textobject("@function.inner", "textobjects") end)
  o_map('ac', function() select.select_textobject("@class.outer", "textobjects") end)
  o_map('ic', function() select.select_textobject("@class.inner", "textobjects") end)

  local swap = require('nvim-treesitter-textobjects.swap')
  n_map('<leader>a', function() swap.swap_next('@parameter.inner') end)
  n_map('<leader>A', function() swap.swap_next('@parameter.outer') end)
  -- todo: finish up config
  -- vim.keymap.set({ "n", "x", "o" }, "]m", function()
  --   require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
  -- end)
  -- vim.keymap.set({ "n", "x", "o" }, "]]", function()
  --   require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
  -- end)
  -- -- You can also pass a list to group multiple queries.
  -- vim.keymap.set({ "n", "x", "o" }, "]o", function()
  --   move.goto_next_start({ "@loop.inner", "@loop.outer" }, "textobjects")
  -- end)
  -- -- You can also use captures from other query groups like `locals.scm` or `folds.scm`
  -- vim.keymap.set({ "n", "x", "o" }, "]s", function()
  --   require("nvim-treesitter-textobjects.move").goto_next_start("@local.scope", "locals")
  -- end)
  -- vim.keymap.set({ "n", "x", "o" }, "]z", function()
  --   require("nvim-treesitter-textobjects.move").goto_next_start("@fold", "folds")
  -- end)
  --
  -- vim.keymap.set({ "n", "x", "o" }, "]M", function()
  --   require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
  -- end)
  -- vim.keymap.set({ "n", "x", "o" }, "][", function()
  --   require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
  -- end)
  --
  -- vim.keymap.set({ "n", "x", "o" }, "[m", function()
  --   require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
  -- end)
  -- vim.keymap.set({ "n", "x", "o" }, "[[", function()
  --   require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
  -- end)
  --
  -- vim.keymap.set({ "n", "x", "o" }, "[M", function()
  --   require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
  -- end)
  -- vim.keymap.set({ "n", "x", "o" }, "[]", function()
  --   require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
  -- end)
  --
  -- -- Go to either the start or the end, whichever is closer.
  -- -- Use if you want more granular movements
  -- vim.keymap.set({ "n", "x", "o" }, "]d", function()
  --   require("nvim-treesitter-textobjects.move").goto_next("@conditional.outer", "textobjects")
  -- end)
  -- vim.keymap.set({ "n", "x", "o" }, "[d", function()
  --   require("nvim-treesitter-textobjects.move").goto_previous("@conditional.outer", "textobjects")
  -- end)
end

function M.setup()
  install_ts_grammars()
  setup_ts_textobjects()
  ts_textobjects_keymaps()

  -- Also see after/plugin/treesitter-autocommands.lua
  -- For auto commands to start treesitter for all relevant filetypes given M.required_parsers
end

return M
