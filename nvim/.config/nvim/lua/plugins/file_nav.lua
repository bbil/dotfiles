-- basic telescope configuration
local function toggle_telescope(harpoon_files)
  local conf = require("telescope.config").values
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require("telescope.pickers").new({}, {
    prompt_title = "Harpoon",
    finder = require("telescope.finders").new_table({
      results = file_paths,
    }),
    previewer = conf.file_previewer({}),
    sorter = conf.generic_sorter({}),
  }):find()
end


return {
  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function(_, _opts)
      telescope = require('telescope')
      telescope.setup({
        defaults = {
          prompt_prefix = "|>",
          selection_caret = "|>",
          entry_prefix = "",
          initial_mode = "insert",
          selection_strategy = "reset",
          sorting_strategy = "ascending",
          layout_strategy = "horizontal",
          --[[ layout_config = {
            vertical = { mirror = true },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          }, ]]
          file_sorter = require("telescope.sorters").get_fuzzy_file,
          generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
          path_display = { "truncate" },
          winblend = 0,
          border = true,
          borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          color_devicons = true,
          set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
          file_previewer = require("telescope.previewers").vim_buffer_cat.new,
          grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
          qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
          -- Developer configurations: Not meant for general override
          buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
            },
          },
        },
      })
      -- Enable telescope fzf native, if installed
      pcall(require('telescope').load_extension, 'fzf')

      -- See `:help telescope.builtin`
      local builtin = require('telescope.builtin')

      local wk = require('which-key')

      -- vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
      vim.keymap.set('n', '<leader>s<CR>', builtin.buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>s/', function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- General Coding
      vim.keymap.set('n', '<leader>sg', builtin.git_files, { desc = '[G]it' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[F]iles' })
      vim.keymap.set('n', '<leader>sr', builtin.live_grep, { desc = '[R]ipGrep' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = 'current [W]ord' })

      -- Diagnostics; Can be useful for LSP
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[D]iagnostics' })

      -- TagStack/Jumplist
      vim.keymap.set('n', '<leader>st', builtin.tagstack, { desc = '[T]ag Stack' })
      vim.keymap.set('n', '<leader>sj', builtin.jumplist, { desc = '[J]ump list' })

      -- Vim help
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[K]eymaps' })

      wk.register({ s = { name = 'Fuzzy Find' } }, { prefix = '<leader>' })
    end
  },

  -- Move between current "working" files fast
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },

    config = function()
      local wk = require('which-key')
      wk.register({ h = { name = 'Harpoon' } }, { prefix = '<leader>' })

      local harpoon = require('harpoon')
      local extensions = require('harpoon.extensions')
      harpoon:setup()

      local nmap = function(keys, func, desc)
        if desc then
          desc = 'Harpoon: ' .. desc
        end

        vim.keymap.set('n', keys, func, { desc = desc })
      end

      nmap('<leader>hu', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, 'UI')
      nmap('<leader>hh', function() harpoon:list():append() end, 'Mark')

      local function create_nav_function(index)
        return function()
          harpoon:list():select(index)
        end
      end

      local nav_funcs = {}
      for i = 1, 5 do
        nav_funcs[i] = create_nav_function(i)
      end

      nmap('<A-a>', nav_funcs[1], "Nav 1")
      nmap('<A-s>', nav_funcs[2], "Nav 2")
      nmap('<A-d>', nav_funcs[3], "Nav 3")
      nmap('<A-f>', nav_funcs[4], "Nav 4")
      nmap('<leader>ha', nav_funcs[1], 'Nav 1')
      nmap('<leader>hs', nav_funcs[2], 'Nav 2')
      nmap('<leader>hd', nav_funcs[3], 'Nav 3')
      nmap('<leader>hf', nav_funcs[4], 'Nav 4')
      nmap('<leader>hg', nav_funcs[5], 'Nav 5')

      nmap('<leader>hp', function() harpoon:list():prev() end, 'Prev')
      nmap('<leader>hn', function() harpoon:list():next() end, 'Next')

      nmap('<leader>sm', function() toggle_telescope(harpoon:list()) end, "open")

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
  },
}
