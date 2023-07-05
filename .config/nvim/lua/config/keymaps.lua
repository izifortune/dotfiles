-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set({ "i" }, "jj", "<esc>")
vim.keymap.set({ "n" }, "<tab>", "<cmd>BufferLineCycleNext<cr>")
vim.keymap.set({ "n" }, "<S-tab>", "<cmd>BufferLineCyclePrev<cr>")
vim.keymap.set({ "n" }, "<C-o>", "<cmd>close<cr>")
vim.keymap.set({ "n" }, "<leader>cd", ":cd %:p:h<cr>")
