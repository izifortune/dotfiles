-- require('orgmode').setup_ts_grammar()
--
-- require'nvim-treesitter.configs'.setup {
--   highlight = {
--     enable = true,
--     disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
--     additional_vim_regex_highlighting = {'org'} -- Required since TS highlighter doesn't support all syntax features (conceal)
--   },
--   indent = {enable = true},
--   ensure_installed = 'all',
--   -- incremental_selection = {
--   --   enable = true,
--   --   keymaps = {
--   --     init_selection = "gnn",
--   --     node_incremental = "grn",
--   --     scope_incremental = "grc",
--   --     node_decremental = "grm"
--   --   }
--   -- },
-- --   textobjects = {
-- --     select = {
-- --       enable = true,
-- --       -- Automatically jump forward to textobj, similar to targets.vim 
-- --       lookahead = true,
-- --       keymaps = {
-- --         -- You can use the capture groups defined in textobjects.scm
-- --         ["af"] = "@function.outer",
-- --         ["if"] = "@function.inner",
-- --         ["ac"] = "@class.outer",
-- --         ["ic"] = "@class.inner"
-- --       }
-- --     },
-- --     move = {
-- --       enable = true,
-- --       set_jumps = true,
-- --       goto_next_start = {
-- --         [']m'] = '@function.outer',
-- --         [']]'] = '@class.outer'
-- --       },
-- --       goto_next_end = {
-- --         [']M'] = '@function.outer',
-- --         [']['] = '@class.outer'
-- --       },
-- --       goto_previous_start = {
-- --         ['[m'] = '@function.outer',
-- --         ['[['] = '@class.outer'
-- --       },
-- --       goto_previous_end = {
-- --         ['[M'] = '@function.outer',
-- --         ['[]'] = '@class.outer'
-- --       }
-- --     },
-- -- lsp_interop = {
-- --       enable = true,
-- --       border = 'none',
-- --       peek_definition_code = {
-- --         ["<leader>pf"] = "@function.outer",
-- --         ["<leader>pF"] = "@class.outer",
-- --       },
-- --     }
-- --   }
-- }
--
vim.api.nvim_command('set foldmethod=expr')
vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')
vim.api.nvim_command('set foldlevelstart=20')

-- Load custom tree-sitter grammar for org filetype
require('orgmode').setup_ts_grammar()

-- Tree-sitter configuration
require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {'org'}, -- Required for spellcheck, some LaTex highlights and code block highlights that do not have ts grammar
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}
