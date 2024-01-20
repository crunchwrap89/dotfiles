-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
  "n",
  "<leader>tf",
  ":term yarn nx test web --test-file %<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "<leader>tw", ":term yarn nx test web<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>te", ":term yarn test:all-except-web<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>cc", "<cmd>CellularAutomaton make_it_rain<CR>")
