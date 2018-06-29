set autoread " Detect file changes outside vim

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

"
call plug#begin('~/.local/share/nvim/plugged')
" call plug#begin('~/.vim/plugged')

Plug 'tomtom/tcomment_vim'
Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim', { 'for': 'html'  } " Zen coding at it's best"
Plug 'othree/html5.vim', { 'for': 'html'  }
Plug 'skwp/greplace.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'Shougo/deoplete.nvim'
Plug 'mhartington/nvim-typescript'
Plug 'w0rp/ale'
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-unimpaired'
Plug 'ujihisa/neco-look'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-pencil'
Plug 'airblade/vim-gitgutter'
Plug 'jparise/vim-graphql'
Plug 'aquach/vim-http-client'
Plug 'https://github.com/Alok/notational-fzf-vim'

" All of your Plugins must be added before the following line
call plug#end()

" absolute width of netrw window
let g:netrw_winsize = -28

" tree-view
let g:netrw_liststyle = 3

" sort is affecting only: directories on the top, files below
let g:netrw_sort_sequence = '[\/]$,*'


" Leader C is the prefix for code related mappîngs 
noremap <silent> <Leader>cc :Tcomment<CR>

set background=dark
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lightline

" let g:lightline = { 'colorscheme': 'base16-default-dark', }               "vim-lightline
set laststatus=2                                                "vim-lightline
set noshowmode                                                  "vim-lightline

"Tabularize
vnoremap <silent> <Leader>cee    :Tabularize /=<CR>              "tabular
vnoremap <silent> <Leader>cet    :Tabularize /#<CR>              "tabular
vnoremap <silent> <Leader>ce     :Tabularize /
"
" make backspaces delete sensibly
set backspace=indent,eol,start

set autowrite
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set smartcase
set ignorecase
set backupdir=~/.vim/tmp/                   " for the backup files
set directory=~/.vim/tmp/                   " for the swap files

inoremap jj <ESC>

set hidden " Some kind of buffer tweak
set history=1000
set undolevels=1000
set title " Set title of the window
set clipboard=unnamed " Use OS clipboard
set encoding=utf-8
set mouse=a
set lazyredraw
set ttyfast
set showmatch " Highlight matching pair
set nobackup " Disable swapfiles
set nowritebackup
set noswapfile
set listchars=eol:¬
set hlsearch
set incsearch
set magic
set showmatch
"Remove visual delay
set timeoutlen=1000 ttimeoutlen=0

set wildmenu
set ruler
set autoindent "Auto indent
filetype plugin indent on
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set ffs=unix,dos,mac

"To check
set expandtab
set smarttab
set shiftwidth=2

set lbr
set tw=500
set ai "Auto indent
set si "Smart indent

set pastetoggle=<leader>sp
set softtabstop=2

" Visual tweaks
" =============
set number " Display number on the sidebar
set relativenumber
set colorcolumn=80
set nowrap
set linebreak
set diffopt+=vertical

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>
vnoremap > ><CR>gv 
vnoremap < <<CR>gv 

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
noremap <space> /
noremap <c-space> ?

" Disable highlight when <leader><cr> is pressed
noremap <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l


" Close the current buffer
noremap <leader>bd :Bclose<cr>

" Close all the buffers
noremap <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
noremap <leader>tn :tabnew<cr>
noremap <leader>to :tabonly<cr>
noremap <leader>tc :tabclose<cr>
noremap <leader>tm :tabmove
noremap <leader>t<leader> :tabnext

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
noremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
noremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
" Remember info about open buffers on close
set viminfo^=%


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
noremap <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
noremap <leader>sn ]s
noremap <leader>sp [s
noremap <leader>sa zg
noremap <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on 
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
  set undodir=~/.vim_runtime/temp_dirs/undodir
  set undofile
catch
endtry

""PLUGINS
map <leader>nn :Explore<cr>
map <leader>nf :Vexplore<cr>
nnoremap <leader>cd :cd %:p:h<CR>

let base16colorspace=256
colorscheme base16-default-dark

" Shortcuts
noremap <leader>ff :Ag 
" map <leader>ff :grep 
noremap <leader>ch :lclose<CR>
noremap <leader>oh :lopen<CR>
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

"keep indend on paste
":nnoremap p p`[v`]=`]`
nnoremap <leader>np p
nnoremap p p=`]


nnoremap <F6> :GundoToggle<CR>
nmap <silent> <c-w>> :vertical resize +10<CR>
nmap <silent> <c-w>< :vertical resize -10<CR>

set grepprg=ag

nmap <C-p> :FZF<CR>
nmap <C-g> :GitFiles<CR>

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
" imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

nnoremap <silent> <leader>p :Buffers<cr>
nnoremap <silent> <leader>Sp :History<cr>
imap <expr> <c-x><c-f> fzf#vim#complete#path('git ls-files $(git rev-parse --show-toplevel)')

function s:formatJSON()
  execute "%!python -m json.tool"
  set syntax=json
endfunction

command FormatJSON call s:formatJSON()

autocmd FileType typescript setlocal completeopt+=menu,preview

"""""""""""""""""
" Tern settings
"""""""""""""""""
let g:tern_show_argument_hints='on_hold'
" and 
let g:tern_map_keys=1

" Useful mappings for managing tabs
noremap <leader>tn :tabnew<cr>
noremap <leader>to :tabonly<cr>
noremap <leader>tc :tabclose<cr>
noremap <leader>tm :tabmove
noremap <leader>t<leader> :tabnext

" Shortcuts using <leader>
noremap <leader>sn ]s
noremap <leader>sp [s
noremap <leader>sa zg
noremap <leader>s? z=

nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<C-n>" : "\<tab>"
" use tab to backward cycle
inoremap <silent><expr><s-tab> pumvisible() ? "\<C-p>" : "\<s-tab>"

" Enable deoplete at startup
let g:deoplete#enable_at_startup = 1

let g:ale_javascript_prettier_use_global = 1
let g:ale_javascript_prettier_options = '--single-quote'

let g:ale_javascript_prettier_eslint_use_global = 1
let g:ale_javascript_prettier_eslint_options = '--single-quote'
let g:ale_linters = {
\    'typescript': ['tslint', 'tsserver'],
\    'html': []
\}
let g:ale_fixers = {
\   'javascript': ['eslint', 'prettier-eslint', 'remove_trailing_lines'],
\   'typescript': ['tslint', 'prettier', 'remove_trailing_lines']
\}

" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'normal'

" Smaller undo
inoremap . .<c-g>u
inoremap ? ?<c-g>u
inoremap ! !<c-g>u
inoremap , ,<c-g>u

" Fzf preview window ?
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger = "<leader>s"
let g:UltiSnipsJumpForwardTrigger = "<leader>sn"
let g:UltiSnipsJumpBackwardTrigger="<leader>sb"

set synmaxcol=128
syntax sync minlines=256
let g:deoplete#auto_complete_delay=150
set foldmethod=indent
set foldlevel=99
" Max width md files
au BufRead,BufNewFile *.md setlocal textwidth=80

nnoremap n nzz
nnoremap N Nzz

" Follow paths js imports
set path=.,src
set suffixesadd=.js,.jsx

function! LoadMainNodeModule(fname)
  let nodeModules = "./node_modules/"
  let packageJsonPath = nodeModules . a:fname . "/package.json"

  if filereadable(packageJsonPath)
    return nodeModules . a:fname . "/" . json_decode(join(readfile(packageJsonPath))).main
  else
    return nodeModules . a:fname
  endif
endfunction

set includeexpr=LoadMainNodeModule(v:fname)

au! BufRead,BufNewFile *.markdown set filetype=mkd
au! BufRead,BufNewFile *.md       set filetype=mkd

autocmd VimEnter *
      \ command! -bang -nargs=* Ag
      \ call fzf#vim#ag(<q-args>, '', { 'options': '--bind ctrl-s:select-all,ctrl-d:deselect-all' }, <bang>0)


" NV search paths for note taking
let g:nv_search_paths = ['~/wiki', '~/writing', 'docs.md' , './notes.md', '~/OneDrive - Ryanair Ltd/wiki']

let vim_markdown_preview_hotkey='<C-m>'
