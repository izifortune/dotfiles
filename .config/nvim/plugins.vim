call plug#begin('~/.local/share/nvim/plugged')

" Comment easy
" Plug 'tpope/vim-commentary'
" Have the file system follow you around
Plug 'airblade/vim-rooter'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'alvan/vim-closetag'
Plug 'liuchengxu/vim-which-key'
Plug 'jbgutierrez/vim-better-comments'
" Theme
" Plug 'chriskempson/base16-vim'
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
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
Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' }
" alt-enter to track remote branch
" ctrl-n to create a branch
" ctrl-d to delete a branch
Plug 'stsewd/fzf-checkout.vim'
" Plug 'antoinemadec/coc-fzf'
Plug 'iamcco/markdown-preview.nvim', { 'for': 'markdown','do': 'cd app & yarn install' }
Plug 'honza/vim-snippets'
Plug 'tpope/vim-unimpaired'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jparise/vim-graphql'
" Plug 'https://github.com/Alok/notational-fzf-vim'
Plug 'ryanoasis/vim-devicons'
" Running your test easily https://github.com/janko/vim-test
Plug 'janko-m/vim-test'

"LSP
" Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-lua/completion-nvim'
" Plug 'RishabhRD/popfix'
" Plug 'RishabhRD/nvim-lsputils'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mhinz/vim-startify'
Plug 'unblevable/quick-scope' 
Plug 'dhruvasagar/vim-table-mode'
Plug 'chrisbra/csv.vim'
Plug 'tpope/vim-repeat'

" Quickfix helpers
" :Reject :Restore
" :help vim-qf
Plug 'romainl/vim-qf'

" Split or join line
" gS or gJ
Plug 'AndrewRadev/splitjoin.vim'

Plug 'voldikss/vim-floaterm'

""GIT STUFF""
" :G goodies
Plug 'tpope/vim-fugitive'
" Git branch viewer :Flog :FlogSplit
Plug 'rbong/vim-flog'
Plug 'lambdalisue/gina.vim'
" Fancy gutters display
" Plug 'airblade/vim-gitgutter'

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
"" UML
Plug 'aklt/plantuml-syntax'
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'tyru/open-browser.vim'

Plug 'chrisbra/Colorizer'
" Plug 'SirVer/ultisnips'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

""Language utils
Plug 'lervag/vimtex', { 'for': 'latex' }
"Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'SidOfc/mkdx', { 'for': 'markdown' }
Plug 'izifortune/follow-markdown-links'

""Tasks and notes""
"\ww or \w\w
" Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'
Plug 'sedm0784/vim-you-autocorrect'

" :TW
Plug 'blindFS/vim-taskwarrior'
""File manager""
"\f
" Plug 'francoiscabrol/ranger.vim' using floatterm
Plug 'rbgrouleff/bclose.vim'
""Misc
" Smooth scrolling
"Plug 'psliwka/vim-smoothie'
" Run commmand to tmux :Vimux...
Plug 'benmills/vimux'
" extend " to dispaly the numbered registers
Plug 'junegunn/vim-peekaboo'
Plug 'reedes/vim-wordy' " Verify quality of writting (see :Wordy)
" Plug 'kkoomen/vim-doge' " Documentation generator
Plug 'tyru/caw.vim'  " Better documentation
Plug 'wellle/context.vim' " Add context base inline
"Plug 'wellle/targets.vim' " Extends targets for ci, vi etc

Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
Plug 'izifortune/weblink.vim'

Plug 'tpope/vim-scriptease'

" All of your Plugins must be added before the following line
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
      \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \|   PlugInstall --sync | q
      \| endif

