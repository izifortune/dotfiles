local dap = require('dap');

dap.adapters.python = {
  type = 'executable';
  command = '/usr/local/bin/python3';
  args = { '-m', 'debugpy.adapter' };
}

dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/code/vscode-node-debug2/out/src/nodeDebug.js'},
}

dap.adapters.chrome = {
  type = "executable",
  command = "node",
  args = {os.getenv("HOME") .. "/code/vscode-chrome-debug/out/src/chromeDebug.js"} -- TODO adjust
}

dap.configurations.javascript = {
  {
    type = 'node2',
    name = 'node',
    request = 'launch',
    program = '${workspaceFolder}/${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    type = "chrome",
    name = 'chrome',
    request = "attach",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    port = 9222,
    webRoot = "${workspaceFolder}"
}
}

dap.configurations.typescript = { -- change to typescript if needed
{
  type = 'node2',
  name = 'node',
  request = 'launch',
  program = '${workspaceFolder}/${file}',
  cwd = vim.fn.getcwd(),
  sourceMaps = true,
  protocol = 'inspector',
  console = 'integratedTerminal',
},
{
  type = "chrome",
  request = "attach",
  program = "${file}",
  cwd = vim.fn.getcwd(),
  sourceMaps = true,
  protocol = "inspector",
  port = 9222,
  webRoot = "${workspaceFolder}",
  url =  "http://localhost:4200",
}
}

vim.api.nvim_set_keymap('n', '<leader>dc', '<cmd>lua require"dap".continue()<CR>', { noremap = false, nowait = true })
vim.api.nvim_set_keymap('n', '<leader>db', '<cmd>lua require"dap".toggle_breakpoint()<CR>', { noremap = false, nowait = true })
vim.api.nvim_set_keymap('n', '<leader>do', '<cmd>lua require"dap".step_over()<CR>', { noremap = false, nowait = true })
