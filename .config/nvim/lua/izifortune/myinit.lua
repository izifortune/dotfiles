require('globals')

require('izifortune.telescope')
require('izifortune.telescope.mappings')
require('izifortune.neuron')
require('izifortune.lsp')
require('izifortune.nvim-dap')
require('izifortune.nvim-dap-ui')
require('izifortune.trouble')
require('izifortune.nvim-cmp')
require('izifortune.nvim-autopairs')
require('gitsigns').setup()
require('izifortune.nvim-treesitter')
require('izifortune.refactoring')
require('izifortune.toggleterm')
require('izifortune.which-key')
require('nvim-tree').setup({ 
  disable_netrw = false,
  update_to_buf_dir = { enable = false }
})
require('Comment').setup()
require('lsp_signature').setup({ toggle_key = '<C-x>' })
require('izifortune.null-ls')
-- require("focus").setup()
-- require('wlsample.evil_line')
require('izifortune.cmp-dictionary')
require('izifortune.telescope-dict')
require('izifortune.dirbuf')
require('neogen').setup({
  enabled = true
})
require('izifortune.orgmode')
require'regexplainer'.setup()
require("grammar-guard").init()
