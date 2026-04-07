-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set(
  "n",
  "<leader>sx",
  function()
    require("fzf-lua").resume()
  end,
  { noremap = true, silent = true, desc = "Resume" }
)

vim.keymap.set("n", "<leader><space>", function()
  if vim.fn.executable("fzf") == 0 then
    vim.notify("fzf is not installed or not in PATH", vim.log.levels.ERROR)
    return
  end
  require("fzf-lua").files()
end, { noremap = true, silent = true, desc = "Find Files" })

vim.api.nvim_create_user_command("LazyGit", function()
  if vim.fn.executable("lazygit") == 0 then
    vim.notify("lazygit is not installed or not in PATH", vim.log.levels.ERROR)
    return
  end

  local ok, snacks = pcall(require, "snacks")
  if ok and snacks.lazygit then
    snacks.lazygit()
    return
  end

  vim.cmd("terminal lazygit")
end, { desc = "Open LazyGit" })

vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { noremap = true, silent = true, desc = "LazyGit" })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
