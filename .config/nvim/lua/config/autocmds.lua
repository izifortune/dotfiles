-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local lastplace = vim.api.nvim_create_augroup("LastPlace", {})

vim.api.nvim_clear_autocmds({ group = lastplace })
vim.api.nvim_create_autocmd("BufReadPost", {
  group = lastplace,
  pattern = { "*" },
  desc = "remember last cursor place",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

local various = vim.api.nvim_create_augroup("Various", {})
vim.api.nvim_clear_autocmds({ group = various })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = various,
  pattern = { "*.http" },
  desc = "Set filetype to http",
  callback = function()
    vim.bo.filetype = "http"
  end,
})

-- Disable autoformat for markdown files
-- local filetype = vim.api.nvim_create_augroup("FileType", {})
-- vim.api.nvim_clear_autocmds({ group = filetype })
-- vim.api.nvim_create_autocmd("FileType", {
--   group = filetype,
--   pattern = { "markdown" },
--   callback = function()
--     vim.b.autoformat = false
--   end,
-- })
vim.api.nvim_create_autocmd("BufReadCmd", {
  pattern = "zipfile:/[^/]*",
  callback = function(args)
    -- the uri is like zipfile:/a/b/c
    local uri = args.match --[[@as string]]
    -- transform it to be zipfile:///a/b/c
    vim.fn["zip#Read"](uri:gsub("^zipfile:", "zipfile://"), 1)
  end,
})
