local M = {}

local function easy_exit_command_window()
  vim.api.nvim_create_autocmd("CmdwinEnter", {
    callback = function()
      local opts = { buffer = true }
      vim.keymap.set("n", "<C-c>", "<Cmd>q<CR>", opts)
      vim.keymap.set("i", "<C-c>", "<Esc><Cmd>q<CR>", opts)
    end,
  })
end

function M.setup()
  easy_exit_command_window()
end

return M
