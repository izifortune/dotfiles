set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevelstart=20

lua <<EOF
require'nvim-treesitter.configs'.setup {
highlight = {
    enable = true,
    },
    }
EOF

