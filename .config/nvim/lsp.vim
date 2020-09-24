let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

lua <<EOF
local nvim_lsp = require'nvim_lsp'
local completion = require'completion'

nvim_lsp.tsserver.setup{
   on_attach = completion.on_attach;
   root_dir = nvim_lsp.util.root_pattern('.git');
}
nvim_lsp.html.setup{
  on_attach = completion.on_attach;
}
nvim_lsp.jsonls.setup{
   on_attach = completion.on_attach;
}
nvim_lsp.pyls.setup{
   on_attach = completion.on_attach;
}
nvim_lsp.vimls.setup{
   on_attach = completion.on_attach;
}
nvim_lsp.yamlls.setup{
   on_attach = completion.on_attach;
}
nvim_lsp.sumneko_lua.setup{
   cmd = { "/Users/fortunatof/.cache/nvim/nvim_lsp/sumneko_lua/lua-language-server/bin/macOS/lua-language-server", "- E", "/Users/fortunatof/.cache/nvim/nvim_lsp/sumneko_lua/lu a-language-server/main.lua" };
   on_attach = completion.on_attach;
}
nvim_lsp.diagnosticls.setup{
   filetypes = { "typescript" }
}
EOF

nnoremap <silent>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <silent>gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent>gfh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent>gr :lua vim.lsp.buf.references()<CR>
nnoremap <silent>K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        execute 'lua vim.lsp.buf.hover()'
    endif
endfunction
