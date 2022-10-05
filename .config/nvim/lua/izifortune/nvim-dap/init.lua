local dap = require("dap")


require("dap-vscode-js").setup({
-- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
debugger_path = "/Users/fortunatof/dev/vscode-js-debug",
adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
})

dap.defaults.fallback.external_terminal = {
	command = "/usr/bin/alacritty",
	args = { "-e" },
}

dap.adapters.python = {
	type = "executable",
	command = "/usr/local/bin/python3",
	args = { "-m", "debugpy.adapter" },
}

dap.adapters.node2 = {
	type = "executable",
	command = "node",
	args = { os.getenv("HOME") .. "/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js" },
}

dap.adapters.chrome = {
    type = "executable",
    command = "node",
    args = {os.getenv("HOME") .. "/dev/vscode-chrome-debug/out/src/chromeDebug.js"} -- TODO adjust
}

-- Add lua
for _, language in ipairs({ "typescript", "javascript" }) do
  require("dap").configurations[language] = {
  {
    type = "pwa-chrome",
    request = "attach",
    name = "Chrome attach",
    port = 9222,
    cwd = "${workspaceFolder}",
  },
  {
    type = "pwa-chrome",
    request = "launch",
    name = "Chrome launch",
    port = 9222,
    cwd = "${workspaceFolder}",
  },
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    cwd = "${workspaceFolder}",
  },
  -- {
  --   type = "pwa-node",
  --   request = "attach",
  --   name = "Attach",
  --   processId = require'dap.utils'.pick_process,
  --   cwd = "${workspaceFolder}",
  -- },
	{
		type = "pwa-node",
		request = "launch",
		name = "Debug Jest Tests",
		-- trace = true, -- include debugger info
		runtimeExecutable = "node",
		runtimeArgs = {
			"${workspaceFolder}/node_modules/.bin/jest",
			"--runInBand",
      "${file}",
      "--watch"
		},
		rootPath = "${workspaceFolder}",
		cwd = "${workspaceFolder}",
		console = "integratedTerminal",
		internalConsoleOptions = "neverOpen",
	},
	{
		name = "Launch",
		type = "node2",
		request = "launch",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
	},
	{
		name = "Jest",
		type = "node2",
		request = "launch",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
		runtimeArgs = "yarn run --inspect-brk jest --watch",
	},
	{
		-- For this to work you need to make sure the node process is started with the `--inspect` flag.
		name = "Attach to process",
		type = "node2",
		request = "attach",
		processId = require("dap.utils").pick_process,
	},
  -- {
  --   type = "chrome",
  --   name = "Chrome",
  --   request = "attach",
  --   program = "${file}",
  --   cwd = vim.fn.getcwd(),
  --   sourceMaps = true,
  --   protocol = "inspector",
  --   port = 9222,
  --   webRoot = "${workspaceFolder}"
  -- }
  }
end

-- dap.configurations.javascript = {
-- 	{
-- 		name = "Launch",
-- 		type = "node2",
-- 		request = "launch",
-- 		program = "${file}",
-- 		cwd = vim.fn.getcwd(),
-- 		sourceMaps = true,
-- 		protocol = "inspector",
-- 		console = "integratedTerminal",
-- 	},
-- 	{
-- 		name = "Jest",
-- 		type = "node2",
-- 		request = "launch",
-- 		program = "${file}",
-- 		cwd = vim.fn.getcwd(),
-- 		sourceMaps = true,
-- 		protocol = "inspector",
-- 		console = "integratedTerminal",
-- 		runtimeArgs = "yarn run --inspect-brk jest --watch",
-- 	},
-- 	{
-- 		-- For this to work you need to make sure the node process is started with the `--inspect` flag.
-- 		name = "Attach to process",
-- 		type = "node2",
-- 		request = "attach",
-- 		processId = require("dap.utils").pick_process,
-- 	},
--   {
--     type = "chrome",
--     name = "Chrome",
--     request = "attach",
--     program = "${file}",
--     cwd = vim.fn.getcwd(),
--     sourceMaps = true,
--     protocol = "inspector",
--     port = 9222,
--     webRoot = "${workspaceFolder}"
--   }
-- }
--
-- dap.configurations.typescript = {
--   {
--     type = "pwa-node",
--     request = "launch",
--     name = "Launch file",
--     program = "${file}",
--     cwd = "${workspaceFolder}",
--   },
--   {
--     type = "pwa-node",
--     request = "attach",
--     name = "Attach",
--     processId = require'dap.utils'.pick_process,
--     cwd = "${workspaceFolder}",
--   },
-- 	{
-- 		type = "pwa-node",
-- 		request = "launch",
-- 		name = "Debug Jest Tests",
-- 		-- trace = true, -- include debugger info
-- 		runtimeExecutable = "node",
-- 		runtimeArgs = {
-- 			"${workspaceFolder}/node_modules/.bin/jest",
-- 			"--runInBand",
--       "${file}",
--       "--watch"
-- 		},
-- 		rootPath = "${workspaceFolder}",
-- 		cwd = "${workspaceFolder}",
-- 		console = "integratedTerminal",
-- 		internalConsoleOptions = "neverOpen",
-- 	},
-- 	{
-- 		name = "Launch",
-- 		type = "node2",
-- 		request = "launch",
-- 		program = "${file}",
-- 		cwd = vim.fn.getcwd(),
-- 		sourceMaps = true,
-- 		protocol = "inspector",
-- 		console = "integratedTerminal",
-- 	},
-- 	{
-- 		name = "Jest",
-- 		type = "node2",
-- 		request = "launch",
-- 		program = "${file}",
-- 		cwd = vim.fn.getcwd(),
-- 		sourceMaps = true,
-- 		protocol = "inspector",
-- 		console = "integratedTerminal",
-- 		runtimeArgs = "yarn run --inspect-brk jest --watch",
-- 	},
-- 	{
-- 		-- For this to work you need to make sure the node process is started with the `--inspect` flag.
-- 		name = "Attach to process",
-- 		type = "node2",
-- 		request = "attach",
-- 		processId = require("dap.utils").pick_process,
-- 	},
--   {
--     type = "chrome",
--     name = "Chrome",
--     request = "attach",
--     program = "${file}",
--     cwd = vim.fn.getcwd(),
--     sourceMaps = true,
--     protocol = "inspector",
--     port = 9222,
--     webRoot = "${workspaceFolder}"
--   }
-- }

-- dap.adapters.node2 = {
--   type = 'executable',
--   command = 'node',
--   args = {os.getenv('HOME') .. '/code/vscode-node-debug2/out/src/nodeDebug.js'},
-- }
--
dap.adapters.chrome = {
	type = "executable",
	command = "node",
	args = { os.getenv("HOME") .. "/code/vscode-chrome-debug/out/src/chromeDebug.js" },
}

dap.configurations.lua = {
	{
		type = "nlua",
		request = "attach",
		name = "Attach to running Neovim instance",
		host = function()
			local value = vim.fn.input("Host [127.0.0.1]: ")
			if value ~= "" then
				return value
			end
			return "127.0.0.1"
		end,
		port = function()
			local val = tonumber(vim.fn.input("Port: "))
			assert(val, "Please provide a port number")
			return val
		end,
	},
}

dap.adapters.nlua = function(callback, config)
	callback({ type = "server", host = config.host, port = config.port })
end

-- dap.configurations.javascript = {
--   {
--     type = 'node2',
--     name = 'node',
--     request = 'launch',
--     program = '${workspaceFolder}/${file}',
--     cwd = vim.fn.getcwd(),
--     sourceMaps = true,
--     protocol = 'inspector',
--     console = 'integratedTerminal',
--   },
--   {
--     type = "chrome",
--     name = 'chrome',
--     request = "attach",
--     program = "${file}",
--     cwd = vim.fn.getcwd(),
--     sourceMaps = true,
--     protocol = "inspector",
--     port = 9222,
--     webRoot = "${workspaceFolder}"
--   },
--   {
--
--     -- For this to work you need to make sure the node process is started with the `--inspect` flag.
--     name = 'Attach to process',
--     type = 'node2',
--     request = 'attach',
--     processId = require'dap.utils'.pick_process,
--   }
-- }
--
-- dap.configurations.typescript = { -- change to typescript if needed
--   {
--     type = 'node2',
--     name = 'node',
--     request = 'launch',
--     program = '${workspaceFolder}/${file}',
--     cwd = vim.fn.getcwd(),
--     sourceMaps = true,
--     protocol = 'inspector',
--     console = 'integratedTerminal',
--   },
--   {
--     type = "chrome",
--     name = 'chrome',
--     request = "attach",
--     program = "${file}",
--     cwd = vim.fn.getcwd(),
--     sourceMaps = true,
--     protocol = "inspector",
--     port = 9222,
--     webRoot = "${workspaceFolder}"
--   },
--   {
--     -- For this to work you need to make sure the node process is started with the `--inspect` flag.
--     name = 'Attach to process',
--     type = 'node2',
--     request = 'attach',
--     sourceMaps = true,
--     processId = require'dap.utils'.pick_process,
--   }
-- }
--
-- Review
-- https://github.com/David-Kunz/vim/blob/master/init.lua
vim.api.nvim_set_keymap("n", "<leader>dc", '<cmd>lua require"dap".continue()<CR>', { noremap = false, nowait = true })
vim.api.nvim_set_keymap(
	"n",
	"<leader>db",
	'<cmd>lua require"dap".toggle_breakpoint()<CR>',
	{ noremap = false, nowait = true }
)
vim.api.nvim_set_keymap("n", "<leader>do", '<cmd>lua require"dap".step_over()<CR>', { noremap = false, nowait = true })
vim.api.nvim_set_keymap("n", "<leader>du", '<cmd>lua require("dapui").toggle()<CR>', { noremap = false, nowait = true })
vim.api.nvim_set_keymap("n", "<leader>t_", ':lua require"jester".run_last()<cr>', { noremap = false, nowait = true })
vim.api.nvim_set_keymap("n", "<leader>tj", ':lua require"jester".run_file()<cr>', { noremap = false, nowait = true })
vim.api.nvim_set_keymap("n", "<leader>df", ':lua require"jester".debug_file()<cr>', { noremap = false, nowait = true })
vim.api.nvim_set_keymap("n", "<leader>d_", ':lua require"jester".debug_last()<cr>', { noremap = false, nowait = true })
vim.api.nvim_set_keymap("n", "<leader>dt", ':Telescope dap commands<cr>', { noremap = false, nowait = true })
