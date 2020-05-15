call plug#begin('~/.local/share/nvim/plugged')

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
"Plug 'psliwka/vim-smoothie'
" Run commmand to tmux :Vimux...
Plug 'benmills/vimux'
" extend " to dispaly the numbered registers
Plug 'junegunn/vim-peekaboo'

" All of your Plugins must be added before the following line
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
      \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \|   PlugInstall --sync | q
      \| endif
