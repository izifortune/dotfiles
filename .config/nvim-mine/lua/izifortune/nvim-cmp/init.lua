-- vim.o.completeopt = "menu,menuone,noselect"
-- Setup nvim-cmp.
local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp = require("cmp")
local lspkind = require("lspkind")
local luasnip = require("luasnip")

cmp.setup({
	enabled = function()
		-- disable completion in comments
		local context = require("cmp.config.context")
    local buftype = vim.api.nvim_buf_get_option(0, "buftype")
    -- Disable for telescope
    if buftype == "prompt" then return false end
		-- keep command mode completion enabled when cursor is in a comment
		if vim.api.nvim_get_mode().mode == "c" then
			return true
		else
			return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
		end
	end,
	completion = {
		completeopt = "menu,menuone,noinsert",
		-- completeopt = 'menu,menuone,noselect',
	},
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
	mapping = {
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<A-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- ["<C-y>"] = cmp.mapping(function(fallback)
		-- 	if luasnip.expand_or_jumpable() then
		-- 		luasnip.expand_or_jump()
		-- 	elseif cmp.visible() then
		-- 		cmp.confirm({ select = true })
  --     else
  --       fallback()
		-- 	end
		-- end),
		["<C-y>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		["<C-n>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
			end
		end, { "i", "s" }),
		["<C-p>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		-- Testing
		["<C-j>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(1) then
				luasnip.jump(1)
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-k>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	sources = {
		{ name = "nvim_lsp" },
		-- { name = "spell" },
		{ name = "nvim_lua" },
		-- {name = 'vsnip'},
		{ name = "orgmode" }, -- For luasnip user.
		{ name = "luasnip" },
		-- For ultisnips user.
		-- { name = 'ultisnips' },
		{ name = "path" },
		{ name = "buffer" },
		{ name = "cmdline" },
		{ name = "dictionary", keyword_length = 2 },
		-- other sources
		-- { name = 'calc' }
	},
  formatting = {
    format = lspkind.cmp_format(),
  },
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
	sources = { { name = "buffer" } },
	mapping = {
		["<C-y>"] = cmp.mapping(function(fallback)
			cmp.confirm({ behavior = cmp.SelectBehavior.ReplaceInsert })
		end, { "i", "c" }),
		["<C-n>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			end
		end, { "i", "c" }),
		["<C-p>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item()
			end
		end, { "i", "c" }),
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
	mapping = {
		["<C-y>"] = cmp.mapping(function(fallback)
			cmp.confirm({ behavior = cmp.SelectBehavior.ReplaceInsert })
		end, { "i", "c" }),
		["<C-n>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			end
		end, { "i", "c" }),
		["<C-p>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item()
			end
		end, { "i", "c" }),
	},
})

cmp.setup.filetype({ "dap-repl", "dapui_watches" }, {
  sources = {
    { name = "dap" },
  },
})
