" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

autocmd BufEnter * lua require'completion'.on_attach()
" Set completeopt to have a better completion experience

" Avoid showing message extra message when using completion
set shortmess+=c

"map <c-p> to manually trigger completion
imap <silent> <c-p> <Plug>(completion_trigger)

" source switching
" imap <c-j> <Plug>(completion_next_source) "use <c-j> to switch to previous completion
" imap <c-k> <Plug>(completion_prev_source) "use <c-k> to switch to next completion


" TODO: Find good mappings for this
" imap  <c-j> <Plug>(completion_next_source)
" imap  <c-k> <Plug>(completion_prev_source)
let g:completion_auto_change_source = 1

let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/coc/ultisnips']
" possible value: 'UltiSnips', 'Neosnippet', 'vim-vsnip', 'snippets.nvim'
let g:completion_enable_snippet = 'UltiSnips'

let g:completion_chain_complete_list = {
      \ 'default': [
      "\    {'complete_items': ['lsp', 'snippet', 'ts', 'tabnine']},
      \    {'complete_items': ['lsp', 'snippet']},
      \    {'complete_items': ['ts']},
      \    {'complete_items': ['tabnine']},
      \    {'mode': '<c-p>'},
      \    {'mode': '<c-n>'}
      \]
      \}
