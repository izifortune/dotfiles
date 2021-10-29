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

parser_configs.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org/tree-sitter-org',
    files = {'src/parser.c', 'src/scanner.cc'},
    },
  filetype = 'org',
}

require'nvim-treesitter.configs'.setup {
  highlight = {
  enable = true,
  use_languagetree = true
  },
}
EOF
