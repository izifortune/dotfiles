nnoremap <leader>R :lua require('spectre').open()<CR>

"search current word
nnoremap <leader>rw :lua require('spectre').open_visual({select_word=true})<CR>
vnoremap <leader>r :lua require('spectre').open_visual()<CR>
