-- keymaps for snacks.picker
-- Snacks plugin needs to be setup first

local km = vim.keymap -- just an alias

local M = {}

local function top_pickers_and_explorer()
  km.set('n', '<leader><space>', function() Snacks.picker.files() end, { desc = 'Find Files' })
  km.set('n', '<leader>,', function() Snacks.picker.buffers() end, { desc = 'Buffers' })
  km.set('n', '<leader>/', function() Snacks.picker.grep() end, { desc = 'Grep' })
  km.set('n', '<leader>s:', function() Snacks.picker.command_history() end, { desc = 'Command History' })
  km.set('n', '<leader>n', function() Snacks.picker.notifications() end, { desc = 'Notification History' })
end

local function find()
  km.set('n', '<leader>ff', function() Snacks.picker.files() end, { desc = 'Find Files' })
  km.set('n', '<leader>fg', function() Snacks.picker.git_files() end, { desc = 'Find Git Files' })
  km.set('n', '<leader>fS', function() Snacks.picker.smart() end, { desc = 'Smart Find Files' })
end

local function git()
  km.set('n', '<leader>sgb', function() Snacks.picker.git_branches() end, { desc = 'Git Branches' })
  km.set('n', '<leader>sgl', function() Snacks.picker.git_log() end, { desc = 'Git Log' })
  km.set('n', '<leader>sgL', function() Snacks.picker.git_log_line() end, { desc = 'Git Log Line' })
  km.set('n', '<leader>sgs', function() Snacks.picker.git_status() end, { desc = 'Git Status' })
  km.set('n', '<leader>sgS', function() Snacks.picker.git_stash() end, { desc = 'Git Stash' })
  km.set('n', '<leader>sgd', function() Snacks.picker.git_diff() end, { desc = 'Git Diff (Hunks)' })
  km.set('n', '<leader>sgf', function() Snacks.picker.git_log_file() end, { desc = 'Git Log File' })
end

local function grep()
  km.set('n', '<leader>sb', function() Snacks.picker.lines() end, { desc = 'Buffer Lines' })
  km.set('n', '<leader>sB', function() Snacks.picker.grep_buffers() end, { desc = 'Grep Open Buffers' })
  km.set('n', '<leader>sg', function() Snacks.picker.grep() end, { desc = 'Grep' })
  km.set({ 'n', 'x' }, '<leader>sw', function() Snacks.picker.grep_word() end, { desc = 'Visual selection or word' })
end

local function search()
  km.set('n', "<leader>s'", function() Snacks.picker.registers() end, { desc = 'Registers' })
  km.set('n', '<leader>s/', function() Snacks.picker.search_history() end, { desc = 'Search History' })
  km.set('n', '<leader>sa', function() Snacks.picker.autocmds() end, { desc = 'Autocmds' })
  km.set('n', '<leader>sb', function() Snacks.picker.lines() end, { desc = 'Buffer Lines' })
  km.set('n', '<leader>sc', function() Snacks.picker.command_history() end, { desc = 'Command History' })
  km.set('n', '<leader>sC', function() Snacks.picker.commands() end, { desc = 'Commands' })
  km.set('n', '<leader>sd', function() Snacks.picker.diagnostics() end, { desc = 'Diagnostics' })
  km.set('n', '<leader>sD', function() Snacks.picker.diagnostics_buffer() end, { desc = 'Buffer Diagnostics' })
  km.set('n', '<leader>sh', function() Snacks.picker.help() end, { desc = 'Help Pages' })
  km.set('n', '<leader>sH', function() Snacks.picker.highlights() end, { desc = 'Highlights' })
  km.set('n', '<leader>si', function() Snacks.picker.icons() end, { desc = 'Icons' })
  km.set('n', '<leader>sj', function() Snacks.picker.jumps() end, { desc = 'Jumps' })
  km.set('n', '<leader>sk', function() Snacks.picker.keymaps() end, { desc = 'Keymaps' })
  km.set('n', '<leader>sl', function() Snacks.picker.loclist() end, { desc = 'Location List' })
  km.set('n', '<leader>sm', function() Snacks.picker.marks() end, { desc = 'Marks' })
  km.set('n', '<leader>sM', function() Snacks.picker.man() end, { desc = 'Man Pages' })
  -- km.set('n', '<leader>sp', function() Snacks.picker.lazy() end, {desc = 'Search for Plugin Spec' })
  km.set('n', '<leader>sq', function() Snacks.picker.qflist() end, { desc = 'Quickfix List' })
end

local function lsp()
  km.set('n', 'gd', function() Snacks.picker.lsp_definitions() end, { desc = 'Goto Definition' })
  km.set('n', 'gD', function() Snacks.picker.lsp_declarations() end, { desc = 'Goto Declaration' })
  km.set('n', 'gr', function() Snacks.picker.lsp_references() end, { nowait = true, desc = 'References' })
  km.set('n', 'gI', function() Snacks.picker.lsp_implementations() end, { desc = 'Goto Implementation' })
  km.set('n', 'gy', function() Snacks.picker.lsp_type_definitions() end, { desc = 'Goto T[y]pe Definition' })
  km.set('n', 'gai', function() Snacks.picker.lsp_incoming_calls() end, { desc = 'C[a]lls Incoming' })
  km.set('n', 'gao', function() Snacks.picker.lsp_outgoing_calls() end, { desc = 'C[a]lls Outgoing' })
  km.set('n', '<leader>ss', function() Snacks.picker.lsp_symbols() end, { desc = 'LSP Symbols' })
  km.set('n', '<leader>sS', function() Snacks.picker.lsp_workspace_symbols() end, { desc = 'LSP Workspace Symbols' })
end

local function less_used()
  km.set('n', '<leader>sR', function() Snacks.picker.resume() end, { desc = 'Resume' })
  km.set('n', '<leader>su', function() Snacks.picker.undo() end, { desc = 'Undo History' })
  km.set('n', '<leader>uC', function() Snacks.picker.colorschemes() end, { desc = 'Colorschemes' })
end

function M.setup()
  top_pickers_and_explorer()
  find()
  git()
  grep()
  search()
  lsp()
  less_used()
end

return M

