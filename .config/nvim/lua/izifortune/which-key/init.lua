local wk = require("which-key")

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local M = {}

wk.setup({
	plugins = { spelling = { enabled = true, suggestion = 20 } },
	presets = {
		operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
		motions = true, -- adds help for motions
		text_objects = true, -- help for text objects triggered after entering an operator
		windows = true, -- default bindings on <c-w>
		nav = true, -- misc bindings to work with windows
		z = true, -- bindings for folds, spelling and others prefixed with z
		g = true, -- bindings for prefixed with g
	},
})

-- NVCHAD https://github.com/NvChad/NvChad/blob/main/lua/core/mappings.lua
--
-- local mappings = utils.load_config().mappings
-- local mapping_groups = { groups = vim.deepcopy(mappings.groups) }
--
-- mappings.disabled = nil
-- mappings.groups = nil
--
-- utils.load_mappings(mapping_groups)
--
-- wk.setup(options)
--

-- Telescope
wk.register({
	["<leader>f"] = {
		name = "+find",
		b = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
		f = { "<cmd>Telescope find_files<cr>", "Find File" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		n = { "<cmd>enew<cr>", "New File" },
		p = {
			function()
				require("telescope.builtin").grep_string({
					short_path = true,
					search = vim.fn.input("Grep String > "),
				})
			end,
			"Grep Word > ",
		},
		l = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
		w = {
			function()
				require("telescope.builtin").grep_string({
					short_path = true,
					word_match = "-w",
					only_sort_text = true,
				})
			end,
			"Find Current Word",
		},
		z = { "<cmd>lua R('izifortune.telescope').search_zettel()<cr>", "Search Zettel" },
	},
})

wk.register({
	["<C-p>"] = { "<cmd>Telescope find_files<cr>", "Find File" },
	-- ["gx"] = { "<Plug>(openbrowser-smart-seach)", "Open browser", noremap = true, silent = true},
})

wk.register({
	-- ['gx'] = {'<Plug>(openbrowser-smart-seach)<cr>', 'Open browser', mode = "v"},
})

wk.register({
	["<leader>e"] = {
		name = "+edit",
		n = { "<cmd>lua R('izifortune.telescope').edit_neovim()<cr>", "Edit Neovim Config" },
		o = { "<cmd>lua R('izifortune.telescope').edit_org()<cr>", "Edit Org" },
		d = { "<cmd>lua R('izifortune.telescope').edit_drive()<cr>", "Edit Drive" },
		z = { "<cmd>lua R('izifortune.telescope').edit_zsh()<cr>", "Edit Zsh" },
	},
})

-- ZK
wk.register({
	["<leader>n"] = {
		name = "+zettel",
		f = { "<cmd>:ZkNotes<cr>", "Search zettel notes" },
		-- f = { "<cmd>:ZkNotes<cr>", "Search zettel notes" }
		-- o = { "<cmd>lua R('izifortune.telescope').edit_org()<cr>", "Edit Org" },
		-- z = { "<cmd>lua R('izifortune.telescope').edit_zsh()<cr>", "Edit Zsh" },
	},
})

wk.register({
	t = {
		name = "Terminal|Tree",
		t = { "<cmd>ToggleTerm<CR>", "Terminal" },
		g = { "<cmd>lua _lazygit_toggle()<CR>", "Lazygit" },
		r = { "<cmd>lua _ranger_toggle()<CR>", "Ranger" },
		c = { "<cmd>lua _repl_toggle()<CR>", "Node REPL" },
		b = { "<cmd>lua _replts_toggle()<CR>", "TSNode REPL" },
		s = { "<cmd>:ToggleTermSendVisualLines<CR>", "Send lines to term", mode = "v" },
		f = { "<cmd>:NvimTreeFindFile<cr>", "Find file" },
		n = { "<cmd>:NvimTreeToggle<cr>", "Toggle Tree" },
	},
}, opts)

wk.register({
	g = {
		name = "Git",
		g = { "<cmd>:Neogit<cr>", "Neogit" },
		b = { "<cmd>:Git blame<cr>", "Blame" },
		l = { "<cmd>:0Gclog<cr>", "Git log file" },
	},
	l = {
		name = "LSP",
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		c = { "<cmd>lua require('izifortune.lsp').server_capabilities()<cr>", "Get Capabilities" },
		d = { "<cmd>TroubleToggle<cr>", "Diagnostics" },
		w = {
			"<cmd>Telescope diagnostics<cr>",
			"Workspace Diagnostics",
		},
		f = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
		F = { "<cmd>LspToggleAutoFormat<cr>", "Toggle Autoformat" },
		i = { "<cmd>LspInfo<cr>", "Info" },
		h = { "<cmd>IlluminationToggle<cr>", "Toggle Doc HL" },
		I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
		j = {
			"<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>",
			"Next Diagnostic",
		},
		k = {
			"<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>",
			"Prev Diagnostic",
		},
		v = { "<cmd>lua require('lsp_lines').toggle()<cr>", "Virtual Text" },
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		o = { "<cmd>SymbolsOutline<cr>", "Outline" },
		q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		R = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace Symbols",
		},
		-- t = { '<cmd>lua require("izifortune.functions").toggle_diagnostics()<cr>', "Toggle Diagnostics" },
	},
	r = {
		name = "+Replace",
		R = { "<cmd>lua require('spectre').open()<CR>", "Replace toggle" },
		r = { "<cmd>lua require('spectre').open_visual()<CR>", "Replace selection", mode = "v" },
		w = { "<cmd>lua require('spectre').open_visual({ select_word=true})<CR>", "Replace word" },
	},
}, opts)
