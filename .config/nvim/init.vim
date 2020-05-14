source $HOME/.config/nvim/plugins.vim

source $HOME/.config/nvim/functions.vim
source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/settings.vim

source $HOME/.config/nvim/colors.vim

source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/easy-align.vim
source $HOME/.config/nvim/plug-config/firenvim.vim
source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/plug-config/goyo.vim
source $HOME/.config/nvim/plug-config/mkdx.vim
source $HOME/.config/nvim/plug-config/rainbow.vim
source $HOME/.config/nvim/plug-config/vim-markdow-preview.vim
source $HOME/.config/nvim/plug-config/vim-markdown.vim
source $HOME/.config/nvim/plug-config/vim-rooter.vim
source $HOME/.config/nvim/plug-config/vimwiki.vim

" absolute width of netrw window
let g:netrw_winsize = -28

" tree-view
let g:netrw_liststyle = 3

" sort is affecting only: directories on the top, files below
let g:netrw_sort_sequence = '[\/]$,*'


"
" make backspaces delete sensibly
set backspace=indent,eol,start

set autowrite
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set ttyfast
set noswapfile
set listchars=eol:¬
set hlsearch
set magic
set showmatch
set wildmenu
set autoindent "Auto indent
filetype plugin indent on
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set ffs=unix,dos,mac

set lbr
set tw=500

set pastetoggle=<leader>sp

" Visual tweaks
" =============
set linebreak
set diffopt+=vertical




" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
" noremap <space> /
" noremap <c-space> ?


" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
au TabLeave * let g:lasttab = tabpagenr()



" Switch CWD to the directory of the open buffer
" noremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" Remember info about open buffers on close
set viminfo^=%


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
set spelllang=en_gb,it
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on 
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
  set undodir=~/.vim_runtime/temp_dirs/undodir
  set undofile
catch
endtry



set grepprg=ag

let g:grep_cmd_opts = '--line-numbers --noheading'


autocmd FileType typescript setlocal completeopt+=menu,preview

set synmaxcol=128
syntax sync minlines=256
let g:deoplete#auto_complete_delay=150
set foldmethod=indent
set foldlevel=99
" Max width md files
au BufRead,BufNewFile *.md setlocal textwidth=80

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

"CSV
let b:csv_arrange_align = 'l*'

"let g:gitgutter_sign_added = '+'
"let g:gitgutter_sign_modified = '>'
"let g:gitgutter_sign_removed = '-'
"let g:gitgutter_sign_removed_first_line = '^'
"let g:gitgutter_sign_modified_removed = '<'


" Quick-scope lazy highlight
let g:qs_lazy_highlight = 1
let g:qs_max_chars=80

"" Use <C-l> for trigger snippet expand.
"imap <C-l> <Plug>(coc-snippets-expand)

"" Use <C-j> for select text for visual placeholder of snippet.
"vmap <C-j> <Plug>(coc-snippets-select)

"" Use <C-j> for jump to next placeholder, it's default of coc.nvim
"let g:coc_snippet_next = '<c-j>'

"" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
"let g:coc_snippet_prev = '<c-k>'

"" Use <C-j> for both expand and jump (make expand higher priority.)
"imap <C-j> <Plug>(coc-snippets-expand-jump)

" Start a new day by copying last day todo
command StartDay !sh ~/scripts/start-day.sh



let g:polyglot_disabled = ['markdown'] " for vim-polyglot users, it loads Plasticboy's markdown
                                       " plugin which unfortunately interferes with mkdx list indentation.
" vimwiki stuff "
" Run multiple wikis "
" let g:vimwiki_list = [
"       \{'path': '~/Documents/VimWiki/personal.wiki'},
"       \{'path': '~/Documents/VimWiki/tech.wiki'}
"       \]

" au BufRead,BufNewFile ~/OneDrive - Ryanair Ltd/wiki/* set filetype=vimwiki

" airline
"
let g:airline#extensions#tabline#enabled = 1
