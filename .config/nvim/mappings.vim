inoremap jj <ESC>
nnoremap <SPACE> <Nop>
let mapleader="\<Space>"

" Disable highlight when <leader><cr> is pressed
noremap <silent> <leader><cr> :noh<cr>

noremap <leader>ss :setlocal spell!<cr>
inoremap <C-l> <C-g>u<Esc>[s1z=`]a<C-g>u

" Shortcuts using <leader>
noremap <leader>sn ]s
noremap <leader>sp [s
noremap <leader>sa zg
noremap <leader>s? z=

" map <leader>nn :Explore<cr>
" map <leader>nf :Vexplore<cr>
" Switching to nerdtree
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

" tnoremap <Esc> <C-\><C-n>

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

" remap paste in visual mode to send the deleted lines to void

vnoremap <leader>p "_dP

"TAB in general mode will move to text buffer
" nnoremap <silent> <TAB> :bnext<CR>
" " nnoremap <expr> <TAB> &buftype ==# 'quickfix' ? ':bnext<CR>' : "\<TAB>"
" " SHIFT-TAB will go back
" nnoremap <silent> <S-TAB> :bprevious<CR>

"" Buffers
" Close the current buffer
" noremap <leader>dd :bdelete<cr>

" TODO Check where they are coming from
noremap <Tab> :BufferNext<cr>
noremap <S-Tab> :BufferPrevious<cr>
" Close all the buffers
noremap <leader>da :%bd\|e#<cr>
noremap <leader>bo :%bd\|e#<cr>

"" Tabs
" Useful mappings for managing tabs
noremap <leader>tn :tabnew<cr>
noremap <leader>to :tabonly<cr>
noremap <leader>tc :tabclose<cr>
noremap <leader>tm :tabmove
noremap <leader>t<leader> :tabnext

noremap <leader>kk :cd ~/code/knowledge<cr>


"teeetsing
" nmap <leader>F :.!toilet -w 200 -f standard<CR>
" nmap <leader>f :.!toilet -w 200 -f small<CR>
" makes Ascii border
nmap <leader>1 :.!toilet -w 200 -f term -F border<CR>

" Primeagen
" Number 5: behave vim"
nnoremap Y y$

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" inoremap <C-j> <esc>:m .+1<CR>==
" inoremap <C-k> <esc>:m .-2<CR>==
