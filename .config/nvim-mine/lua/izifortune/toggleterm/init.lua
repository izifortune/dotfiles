require("toggleterm").setup{}

local Terminal = require('toggleterm.terminal').Terminal
local tmlen = vim.api.nvim_command_output('set timeoutlen?')

local repl = Terminal:new({
  cmd = "NODE_PATH=$(npm root -g) node",
  direction = "horizontal",
  start_in_insert = true,
  insert_mappings = false, -- whether or not the open mapping applies in insert mode
  -- function to run on opening the terminal
  on_open = function(term)
    vim.api.nvim_command('set timeoutlen=1')
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
  close_on_exit = true, -- close the terminal window when the process exits
  -- function to run on closing the terminal
  on_close = function(term)
    vim.api.nvim_command('set ' .. tmlen)
    -- vim.cmd("Closing terminal")
  end,
})

local replts = Terminal:new({
  cmd = "NODE_PATH=$(npm root -g) ts-node",
  direction = "horizontal",
  start_in_insert = true,
  insert_mappings = false, -- whether or not the open mapping applies in insert mode
  -- function to run on opening the terminal
  on_open = function(term)
    vim.api.nvim_command('set timeoutlen=1')
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
  close_on_exit = true, -- close the terminal window when the process exits
  -- function to run on closing the terminal
  on_close = function(term)
    vim.api.nvim_command('set ' .. tmlen)
    -- vim.cmd("Closing terminal")
  end,
})

local ranger = Terminal:new({
  cmd = "ranger",
  direction = "float",
  start_in_insert = true,
  float_opts = {
    border = "double",
  },
  insert_mappings = false, -- whether or not the open mapping applies in insert mode
  -- function to run on opening the terminal
  on_open = function(term)
    vim.api.nvim_command('set timeoutlen=1')
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
  close_on_exit = true, -- close the terminal window when the process exits
  -- function to run on closing the terminal
  on_close = function(term)
    vim.api.nvim_command('set ' .. tmlen)
    -- vim.cmd("Closing terminal")
  end,
})

local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  start_in_insert = true,
  float_opts = {
    border = "double",
  },
  insert_mappings = false, -- whether or not the open mapping applies in insert mode
  -- function to run on opening the terminal
  on_open = function(term)
    vim.api.nvim_command('set timeoutlen=1')
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
    vim.api.nvim_buf_del_keymap(0, 't', '<C-h>')
    vim.api.nvim_buf_del_keymap(0, 't', '<C-j>')
    vim.api.nvim_buf_del_keymap(0, 't', '<C-k>')
    vim.api.nvim_buf_del_keymap(0, 't', '<C-l>')
  end,
  close_on_exit = true, -- close the terminal window when the process exits
  -- function to run on closing the terminal
  on_close = function(term)
    vim.api.nvim_command('set ' .. tmlen)
    -- vim.cmd("Closing terminal")
  end,
})

function _lazygit_toggle()
  lazygit:toggle()
end

function _ranger_toggle()
  ranger:toggle()
end

function _repl_toggle()
  repl:toggle()
end

function _replts_toggle()
  replts:toggle()
end

function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  -- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jj', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
  -- vim.api.nvim_buf_del_keymap(0, 'i', 'jj')
  vim.b.nowrap = true
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
vim.cmd([[
autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif
]])

vim.api.nvim_create_user_command(
    'T',
  function (args)
    require('toggleterm').exec(args['args'])
  end,
  { nargs = '?' }
)
