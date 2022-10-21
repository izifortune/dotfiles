M = {}
local opts = { noremap = true, silent = true }
-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'",
               {expr = true, silent = true})
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'",
               {expr = true, silent = true})

-- Remap space as leader key
vim.keymap.set({'n', 'v'}, '<Space>', '<Nop>', {silent = true})
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight',
                                                    {clear = true})
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank() end,
    group = highlight_group,
    pattern = '*'
})

-- Map blankline
vim.g.indent_blankline_char = '┊'
vim.g.indent_blankline_filetype_exclude = {'help', 'packer'}
vim.g.indent_blankline_buftype_exclude = {'terminal', 'nofile'}
vim.g.indent_blankline_show_trailing_blankline_indent = false

-- Escape shortcut
vim.keymap.set('i', 'jj', '<ESC>', {silent = true})

-- Spelling shortcuts
vim.keymap.set('n', '<leader>ss', ':setlocal spell!<cr>', {silent = true})
vim.keymap.set('i', '<C-l>', '<C-g>u<Esc>[s1z=`]a<C-g>u', {silent = true})

-- CD 
vim.keymap.set('n', '<leader>cd', ':cd %:p:h<cr>', {silent = true})

-- Vertical resize
vim.keymap.set('n', '<c-w>>', ':vertical resize -30<cr>', {silent = true})
vim.keymap.set('n', '<c-w><', ':vertical resize +30<cr>', {silent = true})

-- Search and center
vim.keymap.set('n', 'n', 'nzzzv', {silent = true})
vim.keymap.set('n', 'N', 'Nzzzv', {silent = true})

-- Navigate splits
vim.keymap.set('n', '<C-j>', '<C-W>j', {silent = true})
vim.keymap.set('n', '<C-k>', '<C-W>k', {silent = true})
vim.keymap.set('n', '<C-h>', '<C-W>h', {silent = true})
vim.keymap.set('n', '<C-l>', '<C-W>l', {silent = true})

-- Buffers delete
vim.keymap.set('n', '<leader>bd', ':Bdelete<cr>', {silent = true})
-- Delete all buffers except current
-- vim.keymap.set('n', '<leader>ba', ':%bd\|e#<cr>', {silent = true})

-- Tab buffer moving
vim.keymap.set('n', '<Tab>', ':BufferNext<cr>', {silent = true})
vim.keymap.set('n', '<S-Tab>', ':BufferPrevious<cr>', {silent = true})

vim.keymap.set('n', '<leader>kk', ':cd ~/code/knowledge<cr>', {silent = true})
-- vim.keymap.set('n', 'gp', ':%!prettier --stdin-filepath %<cr>', { silent = true})
--
vim.keymap.set('n', 'gx', '<Plug>(openbrowser-smart-seach)')
vim.keymap.set('n', '-', '-', opts)

M.show_documentation = function()
  local filetype = vim.bo.filetype
  if vim.tbl_contains({ "vim", "help" }, filetype) then
    vim.cmd("h " .. vim.fn.expand "<cword>")
  elseif vim.tbl_contains({ "man" }, filetype) then
    vim.cmd("Man " .. vim.fn.expand "<cword>")
  elseif vim.fn.expand "%:t" == "Cargo.toml" then
    require("crates").show_popup()
  else
    vim.lsp.buf.hover()
  end
end

vim.keymap.set("n", "K", ":lua require('izifortune.mappings').show_documentation()<CR>", opts)

return M

-- vim.api.nvim_create_autocmd('TerminalAU', [[
--   BufEnter * if &buftype == 'terminal' | :startinsert | endif
-- ]])
