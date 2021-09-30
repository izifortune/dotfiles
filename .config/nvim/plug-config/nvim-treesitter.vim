set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevelstart=20

lua <<EOF
local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
  install_info = {
    url = "https://github.com/vhyrro/tree-sitter-norg",
    files = { "src/parser.c" },
    branch = "main"
    },
  }

require'nvim-treesitter.configs'.setup {
  highlight = {
  enable = true,
  use_languagetree = true
  },
}
EOF
