require("globals")

require("izifortune.settings")
require("izifortune.mappings")
require("izifortune.functions")
require("izifortune.telescope")
-- require('izifortune.telescope.mappings')
-- require('izifortune.neuron')
require("izifortune.lsp")
require("izifortune.nvim-dap")
require("izifortune.trouble")
require("izifortune.nvim-cmp")
require("nvim-autopairs").setup({
	disable_filetype = { "TelescopePrompt", "vim" },
})
require("izifortune.gitsigns")
require("izifortune.nvim-treesitter")
-- require('izifortune.refactoring')
require("izifortune.toggleterm")
require("izifortune.which-key")
require("nvim-tree").setup({
	disable_netrw = false,
	respect_buf_cwd = true,
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
})
require("Comment").setup()
-- require("lsp_signature").setup({ toggle_key = "<C-x>" })
require("izifortune.null-ls")
-- require("focus").setup()
-- require('wlsample.evil_line')
require("izifortune.cmp-dictionary")
require("izifortune.telescope-dict")
require("izifortune.dirbuf")
require("neogen").setup({ enabled = true })
require("izifortune.orgmode")
require("regexplainer").setup()
require("jester").setup({
	cmd = "yarn run jest $result $file", -- run command
	path_to_jest_debug = "",
})
require("dapui").setup({})
require("project_nvim").setup({
	manual_mode = true,
})
require("izifortune.hydra")
require("izifortune.pounce")
require("org-bullets").setup()
require("nvim-surround").setup()
require("bufferline").setup({
	icon_separator_active = "▎",
	icon_separator_inactive = "&",
})
require("colorizer").setup()
require("zk").setup()
require("izifortune.vim-mergetool")
require("izifortune.nvim-ufo")
require("izifortune.lualine")
require("izifortune.ryanair_functions")
require("luasnip.loaders.from_snipmate").lazy_load()
-- require("luasnip.loaders.from_vscode").lazy_load({ paths = {"~/.local/share/nvim/plugged/vscode-angular-snippets"}})
require("luasnip.loaders.from_vscode").lazy_load()
-- require("izifortune.easypick")
require("live-command").setup {
  commands = {
    Norm = { cmd = "norm" },
    G = { cmd = "g"},
    Reg = {
      cmd = "norm",
      -- This will transform ":5Reg a" into ":norm 5@a"
      args = function(opts)
        return (opts.count == -1 and "" or opts.count) .. "@" .. opts.args
      end,
      range = "",
    },
  },
}
require("izifortune.noice")
