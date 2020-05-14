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

" Comment easy
Plug 'preservim/nerdcommenter'
" Have the file system follow you around
Plug 'airblade/vim-rooter'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'alvan/vim-closetag'
Plug 'liuchengxu/vim-which-key'
Plug 'jbgutierrez/vim-better-comments'
" Theme
Plug 'chriskempson/base16-vim'
" Plug 'itchyny/lightline.vim'
" Airline stuff
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Syntax highlight
Plug 'sheerun/vim-polyglot'
" Respect editorconfig
Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim', { 'for': 'html'  } " Zen coding at it's best"
Plug 'othree/html5.vim', { 'for': 'html'  }
Plug 'skwp/greplace.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'iamcco/markdown-preview.nvim', { 'for': 'markdown','do': 'cd app & yarn install' }
Plug 'honza/vim-snippets'
Plug 'tpope/vim-unimpaired'
Plug 'christoomey/vim-tmux-navigator'
Plug 'reedes/vim-pencil'
Plug 'jparise/vim-graphql'
" Plug 'https://github.com/Alok/notational-fzf-vim'
Plug 'ryanoasis/vim-devicons'
" Running your test easily https://github.com/janko/vim-test
Plug 'janko-m/vim-test'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sodapopcan/vim-twiggy'
Plug 'mhinz/vim-startify'
Plug 'shime/vim-livedown', { 'do': 'npm install -g livedown'}
Plug 'unblevable/quick-scope' 
Plug 'dhruvasagar/vim-table-mode'
Plug 'chrisbra/csv.vim', { 'for': 'csv' }

""GIT STUFF""
" :G goodies
Plug 'tpope/vim-fugitive'
" Git branch viewer :Flog :FlogSplit
Plug 'rbong/vim-flog'
" Fancy gutters display
Plug 'airblade/vim-gitgutter'

""Focus ""
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'

Plug 'reedes/vim-colors-pencil'
Plug 'rhysd/vim-grammarous'
Plug 'Ron89/thesaurus_query.vim', { 'for': 'markdown' }
Plug 'junegunn/vim-easy-align'
Plug 'jreybert/vimagit'
Plug 'junegunn/gv.vim'
"" Relax
" :VimGameCodeBreak
Plug 'johngrib/vim-game-code-break'
Plug 'scrooloose/vim-slumlord'
Plug 'aklt/plantuml-syntax'
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'tyru/open-browser.vim'
Plug 'chrisbra/Colorizer'
Plug 'SirVer/ultisnips'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
""Language utils
Plug 'lervag/vimtex'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'SidOfc/mkdx', { 'for': 'markdown' }

""Tasks and notes""
"\ww or \w\w
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'
" :TW
Plug 'blindFS/vim-taskwarrior'
""File manager""
"\f
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
""Misc
" Smooth scrolling
Plug 'psliwka/vim-smoothie'
" Run commmand to tmux :Vimux...
Plug 'benmills/vimux'
" extend " to dispaly the numbered registers
Plug 'junegunn/vim-peekaboo'


" All of your Plugins must be added before the following line
call plug#end()

source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/functions.vim
source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/colors.vim

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
set smartcase
set ignorecase
set backupdir=~/.vim/tmp/                   " for the backup files
set directory=~/.vim/tmp/                   " for the swap files


set history=1000
set undolevels=1000
set title " Set title of the window
set lazyredraw
set ttyfast
set showmatch " Highlight matching pair
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

"""""""""""""""""
" Tern settings
"""""""""""""""""
let g:tern_show_argument_hints='on_hold'
" and 
let g:tern_map_keys=1

"nnoremap <A-h> <C-w>h
"nnoremap <A-j> <C-w>j
"nnoremap <A-k> <C-w>k
"nnoremap <A-l> <C-w>l


" " Fzf preview window ?
" command! -bang -nargs=* Ag
"   \ call fzf#vim#ag(<q-args>,
"   \                 <bang>0 ? fzf#vim#with_preview('up:60%')
"   \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
"   \                 <bang>0)

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


" au! BufRead,BufNewFile *.markdown set filetype=mkd
" au! BufRead,BufNewFile *.md       set filetype=mkd

" autocmd VimEnter *
"       \ command! -bang -nargs=* Ag
"       \ call fzf#vim#ag(<q-args>, '', { 'options': '--bind ctrl-s:select-all,ctrl-d:deselect-all' }, <bang>0)


" NV search paths for note taking
let g:nv_search_paths = ['~/wiki', '~/writing', 'docs.md' , './notes.md', '~/OneDrive - Ryanair Ltd/wiki']


let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

"AWESOME PREVIEW FZF

" ripgrep
" if executable('rg')
"   let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
"   set grepprg=rg\ --vimgrep
"   command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
" endif

" Files + devicons
" function! Fzf_dev()
"   let l:fzf_files_options = '--preview "bat --theme="OneHalfDark" --style=numbers,changes --color always {2..-1} | head -'.&lines.'"'
"
"   function! s:files()
"     let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
"     return s:prepend_icon(l:files)
"   endfunction
"
"   function! s:prepend_icon(candidates)
"     let l:result = []
"     for l:candidate in a:candidates
"       let l:filename = fnamemodify(l:candidate, ':p:t')
"       let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
"       call add(l:result, printf('%s %s', l:icon, l:candidate))
"     endfor
"
"     return l:result
"   endfunction
"
"   function! s:edit_file(item)
"     let l:pos = stridx(a:item, ' ')
"     let l:file_path = a:item[pos+1:-1]
"     execute 'silent e' l:file_path
"   endfunction
"
"   call fzf#run({
"         \ 'source': <sid>files(),
"         \ 'sink':   function('s:edit_file'),
"         \ 'options': '-m ' . l:fzf_files_options,
"         \ 'down':    '40%' })
" endfunction


""
"" COC Settings
""



" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>g  <Plug>(coc-format-selected)
nmap <leader>g  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
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
let g:mkdp_page_title = '${name}'

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

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


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


" Quick-scope lazy highlight
let g:qs_lazy_highlight = 1
let g:qs_max_chars=80

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

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


" Firenvim
let g:firenvim_config = { 
    \ 'globalSettings': {
        \ '.*': {
        \ 'cmdline': 'neovim',
        \ 'priority': 0,
        \ 'selector': 'textarea',
        \ 'takeover': 'never',
        \ },
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'priority': 0,
            \ 'selector': 'textarea',
            \ 'takeover': 'never',
        \ },
    \ }
\ }

let g:vimwiki_list = [{'path': '~/OneDrive - Ryanair Ltd/wiki/',
      \ 'syntax': 'markdown', 'ext': '.md'}, 
      \{'path': '~/Google Drive/wiki',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

let g:mkdx#settings     = { 'highlight': { 'enable': 1 },
                        \ 'map': { 'prefix': '<leader>' },
                        \ 'enter': { 'shift': 1 },
                        \ 'links': { 'external': { 'enable': 1 } },
                        \ 'toc': { 'text': 'Table of Contents', 'update_on_write': 1 },
                        \ 'fold': { 'enable': 1 } }

let g:polyglot_disabled = ['markdown'] " for vim-polyglot users, it loads Plasticboy's markdown
let g:vimwiki_global_ext = 0
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

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Which key

