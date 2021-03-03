" Magic buffer-picking mode
nnoremap <silent> <C-s> :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <leader>dd :BufferClose<CR>
" nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
" Move to previous/next
nnoremap <silent>  <TAB> :BufferNext<CR>
nnoremap <silent>   <S-TAB> :BufferPrevious<CR>
