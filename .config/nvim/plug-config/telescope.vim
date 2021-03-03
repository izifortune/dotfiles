" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fw <cmd>Telescope grep_string<cr>
nnoremap <leader>fc <cmd>Telescope command_history<cr>
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-g> <cmd>Telescope git_files<cr>
command! Test lua require 'izifortune.telescope'.edit_neovim()
