inoremap jj <ESC>

" Disable highlight when <leader><cr> is pressed
noremap <silent> <leader><cr> :noh<cr>

noremap <leader>ss :setlocal spell!<cr>
inoremap <C-l> <C-g>u<Esc>[s1z=`]a<C-g>u

" Shortcuts using <leader>
noremap <leader>sn ]s
noremap <leader>sp [s
noremap <leader>sa zg
noremap <leader>s? z=

map <leader>nn :Explore<cr>
map <leader>nf :Vexplore<cr>
nnoremap <leader>cd :cd %:p:h<CR>

" map <leader>ff :grep 
noremap <leader>ch :lclose<CR>
noremap <leader>oh :lopen<CR>
"keep indend on paste
":nnoremap p p`[v`]=`]`
nnoremap <leader>np p
nnoremap p p=`]

nmap <silent> <c-w>> :vertical resize +10<CR>
nmap <silent> <c-w>< :vertical resize -10<CR>

" Smaller undo
inoremap . .<c-g>u
inoremap ? ?<c-g>u
inoremap ! !<c-g>u
inoremap , ,<c-g>u

nnoremap <silent> <C-p> :Files<CR>

tnoremap <Esc> <C-\><C-n>

nnoremap n nzz
nnoremap N Nzz

"" Splits

" Smart way to move between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Swap splits
map <leader>th <C-w>t<C-w>H
map <leader>tk <C-w>t<C-w>K

" Resize splits
noremap <silent> <C-M-l> :vertical resize +3<CR>
noremap <silent> <C-M-h> :vertical resize -3<CR>
noremap <silent> <C-M-k> :resize +3<CR>
noremap <silent> <C-M-j> :resize -3<CR>

vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>
vnoremap > ><CR>gv 
vnoremap < <<CR>gv 

" TAB in general mode will move to text buffer
nnoremap <silent> <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <silent> <S-TAB> :bprevious<CR>


"" Buffers

" Close the current buffer
noremap <leader>bd :Bclose<cr>

" Close all the buffers
noremap <leader>ba :1,1000 bd!<cr>

"" Tabs
" Useful mappings for managing tabs
noremap <leader>tn :tabnew<cr>
noremap <leader>to :tabonly<cr>
noremap <leader>tc :tabclose<cr>
noremap <leader>tm :tabmove
noremap <leader>t<leader> :tabnext


"" Plugins

"""  GitGutter
" Jump between hunks
nmap <Leader>gn <Plug>GitGutterNextHunk  " git next
nmap <Leader>gp <Plug>GitGutterPrevHunk  " git previous
" Hunk-add and hunk-revert for chunk staging
nmap <Leader>ga <Plug>GitGutterStageHunk  " git add (chunk)
nmap <Leader>gu <Plug>GitGutterUndoHunk   " git undo (chunk)

""" WhichKey
nnoremap <silent> <leader> :WhichKey '\'<CR>

""" Fugitive
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>ga :Gcommit --amend<CR>
nnoremap <leader>gt :Gcommit -v -q %<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! Glog<CR>
nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :Dispatch! git push<CR>
nnoremap <leader>gpl :Dispatch! git pull<CR>

""" Tabularize
vnoremap <silent> <Leader>cee    :Tabularize /=<CR>         
vnoremap <silent> <Leader>cet    :Tabularize /#<CR>          
vnoremap <silent> <Leader>ce     :Tabularize /

""" FZF
" Silver searcher
noremap <leader>ff :Ag 

" nmap <C-p> :FZF<CR>
nmap <C-g> :GitFiles<CR>

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)


" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
imap <expr> <c-x><c-f> fzf#vim#complete#path('git ls-files $(git rev-parse --show-toplevel)')

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

nnoremap <silent> <leader>p :Buffers<cr>
nnoremap <silent> <leader>Sp :History<cr>

