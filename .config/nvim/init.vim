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
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
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
Plug 'ryanoasis/vim-devicons'
Plug 'janko-m/vim-test'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'sodapopcan/vim-twiggy'
Plug 'mhinz/vim-startify'
Plug 'shime/vim-livedown', { 'do': 'npm install -g livedown'}
Plug 'unblevable/quick-scope' 
Plug 'dhruvasagar/vim-table-mode'
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
Plug 'junegunn/goyo.vim'
Plug 'rbong/vim-flog'
Plug 'junegunn/limelight.vim'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'reedes/vim-colors-pencil'
Plug 'rhysd/vim-grammarous'
Plug 'Ron89/thesaurus_query.vim', { 'for': 'markdown' }
Plug 'SidOfc/mkdx', { 'for': 'markdown' }
Plug 'junegunn/vim-easy-align'
Plug 'jreybert/vimagit'
Plug 'junegunn/gv.vim'
Plug 'johngrib/vim-game-code-break'
Plug 'scrooloose/vim-slumlord'
Plug 'aklt/plantuml-syntax'
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'tyru/open-browser.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'benmills/vimux'
Plug 'chrisbra/Colorizer'
Plug 'dense-analysis/ale'
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'


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
vnoremap <silent> <Leader>cee    :Tabularize /=<CR>         
vnoremap <silent> <Leader>cet    :Tabularize /#<CR>          
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
set encoding=UTF-8
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
" noremap <space> /
" noremap <c-space> ?

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
" noremap <leader>cd :cd %:p:h<cr>:pwd<cr>

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
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline 

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

let g:grep_cmd_opts = '--line-numbers --noheading'

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
" let g:UltiSnipsExpandTrigger = "<leader>s"
" let g:UltiSnipsJumpForwardTrigger = "<leader>sn"
" let g:UltiSnipsJumpBackwardTrigger="<leader>sb"

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
set suffixesadd=.js,.jsx,.ts

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

" au! BufRead,BufNewFile *.markdown set filetype=mkd
" au! BufRead,BufNewFile *.md       set filetype=mkd

autocmd VimEnter *
      \ command! -bang -nargs=* Ag
      \ call fzf#vim#ag(<q-args>, '', { 'options': '--bind ctrl-s:select-all,ctrl-d:deselect-all' }, <bang>0)


" NV search paths for note taking
let g:nv_search_paths = ['~/wiki', '~/writing', 'docs.md' , './notes.md', '~/OneDrive - Ryanair Ltd/wiki']

" Pyenv
" let g:python_host_prog = '/Users/fortune/.pyenv/versions/2.7.11/bin/python'
" let g:python3_host_prog = '/Users/fortune/.pyenv/versions/3.6.6/bin/python'
"
" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

"AWESOME PREVIEW FZF
nnoremap <silent> <C-p> :call Fzf_dev()<CR>

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

" Files + devicons
function! Fzf_dev()
  let l:fzf_files_options = '--preview "bat --theme="OneHalfDark" --style=numbers,changes --color always {2..-1} | head -'.&lines.'"'

  function! s:files()
    let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
    return s:prepend_icon(l:files)
  endfunction

  function! s:prepend_icon(candidates)
    let l:result = []
    for l:candidate in a:candidates
      let l:filename = fnamemodify(l:candidate, ':p:t')
      let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
      call add(l:result, printf('%s %s', l:icon, l:candidate))
    endfor

    return l:result
  endfunction

  function! s:edit_file(item)
    let l:pos = stridx(a:item, ' ')
    let l:file_path = a:item[pos+1:-1]
    execute 'silent e' l:file_path
  endfunction

  call fzf#run({
        \ 'source': <sid>files(),
        \ 'sink':   function('s:edit_file'),
        \ 'options': '-m ' . l:fzf_files_options,
        \ 'down':    '40%' })
endfunction


" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <C-d> <Plug>(coc-range-select)
" xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" endCOC

" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }

" Markdown preview
let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_toggle=1

" let g:vim_markdown_new_list_item_indent = 0

" Twiggy conf
let g:twiggy_group_locals_by_slash = 0
let g:twiggy_local_branch_sort = 'mru'
let g:twiggy_remote_branch_sort = 'date'

" Formatlist https://vimways.org/2018/formatting-lists-with-vim/
set formatlistpat=^\\s*                     " Optional leading whitespace
set formatlistpat+=[                        " Start character class
set formatlistpat+=\\[({]\\?                " |  Optionally match opening punctuation
set formatlistpat+=\\(                      " |  Start group
set formatlistpat+=[0-9]\\+                 " |  |  Numbers
set formatlistpat+=\\\|                     " |  |  or
set formatlistpat+=[a-zA-Z]\\+              " |  |  Letters
set formatlistpat+=\\)                      " |  End group
set formatlistpat+=[\\]:.)}                 " |  Closing punctuation
set formatlistpat+=]                        " End character class
set formatlistpat+=\\s\\+                   " One or more spaces
set formatlistpat+=\\\|                     " or
set formatlistpat+=^\\s*[-–+o*•]\\s\\+      " Bullet points

nnoremap ,f :find **/*<C-z><S-Tab>



augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


" Using CocList
" Show all diagnostics
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" " Show commands
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"
"CSV
let b:csv_arrange_align = 'l*'

"Goyo integration limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" wild options
" set wildoptions=pum
"
" set pumblend=20

" Align GitHub-flavored Markdown tables
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'

" Jump between hunks
nmap <Leader>gn <Plug>GitGutterNextHunk  " git next
nmap <Leader>gp <Plug>GitGutterPrevHunk  " git previous
" Hunk-add and hunk-revert for chunk staging
nmap <Leader>ga <Plug>GitGutterStageHunk  " git add (chunk)
nmap <Leader>gu <Plug>GitGutterUndoHunk   " git undo (chunk)

" Quick-scope lazy highlight
let g:qs_lazy_highlight = 1
let g:qs_max_chars=80

" Use <C-l> for trigger snippet expand.
" imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

nnoremap <silent> <leader>y  :<C-u>CocList -A --normal yank<cr>

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Indent list
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1
let g:vim_markdown_conceal_code_blocks = 0
set conceallevel=2
let g:vim_markdown_fenced_languages = ['c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini', 'javascript=javascript', 'typescript=typescript']


" Start a new day by copying last day todo
command StartDay !sh ~/scripts/start-day.sh

" paste image
" nnoremap <silent> <leader>m :call MarkdownClipboardImage()<cr>

" function! MarkdownClipboardImage() abort
"   " Create `img` directory if it doesn't exist
"   let img_dir = expand("%:.:h") . '/img'
"   " if !isdirectory(img_dir)
"   "   silent call mkdir(img_dir)
"   " endif
"
"   " First find out what filename to use
"   let index = 1
"   let file_path = img_dir . "/image" . index . ".png"
"   while filereadable(file_path)
"     let index = index + 1
"     let file_path = img_dir . "/image" . index . ".png"
"   endwhile
"
"   let clip_command = 'osascript'
"   let clip_command .= ' -e "set png_data to the clipboard as «class PNGf»"'
"   let clip_command .= ' -e "set referenceNumber to open for access POSIX path of'
"   let clip_command .= ' (POSIX file \"' . file_path . '\") with write permission"'
"   let clip_command .= ' -e "write png_data to referenceNumber"'
"
"   silent call system(clip_command)
"   if v:shell_error == 1
"     normal! p
"   else
"     execute "normal! i![](" . file_path . ")"
"   endif
" endfunction
"
" command MarkdownClipboardImage :call MarkdownClipboardImage()

command MarkdownClipboardImage :call MarkdownClipboardImage()

function! MarkdownClipboardImage() abort
  " Create `img` directory if it doesn't exist
  let img_dir = expand("%:p:h")  . '/img'
  echo img_dir
  if !isdirectory(img_dir)
    silent call mkdir(img_dir)
  endif

  " First find out what filename to use
  let index = 1
  let file_path = img_dir . "/image" . index . ".png"
  while filereadable(file_path)
    let index = index + 1
    let file_path = img_dir . "/image" . index . ".png"
  endwhile

  let clip_command = 'osascript'
  let clip_command .= ' -e "set png_data to the clipboard as «class PNGf»"'
  let clip_command .= ' -e "set referenceNumber to open for access POSIX path of'
  let clip_command .= ' (POSIX file \"' . file_path . '\") with write permission"'
  let clip_command .= ' -e "write png_data to referenceNumber"'

  silent call system(clip_command)
  if v:shell_error == 1
    normal! p
  else
    execute "normal! i[](" . file_path . ")"
  endif
endfunction


let g:UltiSnipsSnippetDirectories=["UltiSnips", "~/.config/nvim/snippets"]
