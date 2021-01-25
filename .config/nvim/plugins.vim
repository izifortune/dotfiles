call plug#begin('~/.local/share/nvim/plugged')

" Comment easy
" Have the file system follow you around
Plug 'airblade/vim-rooter'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'alvan/vim-closetag'
Plug 'liuchengxu/vim-which-key'
Plug 'jbgutierrez/vim-better-comments'
" Theme
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
" Airline stuff
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Buffer bar in LUA
Plug 'romgrk/barbar.nvim'
" Buffer commands 
Plug 'moll/vim-bbye'
" Split resie
Plug 'simeji/winresizer'
" Syntax highlight
" Plug 'sheerun/vim-polyglot'
" Respect editorconfig
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'szw/vim-maximizer'
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
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
" alt-enter to track remote branch
Plug 'iamcco/markdown-preview.nvim', { 'for': 'markdown','do': 'cd app & yarn install' }
Plug 'szymonmaszke/vimpyter' "vim-plug
Plug 'honza/vim-snippets'
Plug 'tpope/vim-unimpaired'
Plug 'jparise/vim-graphql'
Plug 'ryanoasis/vim-devicons'
Plug 'puremourning/vimspector'
Plug 'unblevable/quick-scope' 

"LSP
" Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-lua/completion-nvim'
" Plug 'RishabhRD/popfix'
" Plug 'RishabhRD/nvim-lsputils'
" Plug 'nvim-lua/popup.nvim'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mhinz/vim-startify'
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
Plug 'izifortune/weblink.vim'
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
"" UML
Plug 'aklt/plantuml-syntax'
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'tyru/open-browser.vim'
Plug 'chrisbra/Colorizer'

""Language utils
Plug 'lervag/vimtex', { 'for': 'latex' }
Plug 'SidOfc/mkdx', { 'for': 'markdown' }
Plug 'izifortune/follow-markdown-links'
Plug 'reedes/vim-wordy' " Verify quality of writting (see :Wordy)
Plug 'dpelle/vim-LanguageTool'
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-cheat.sh'

""Tasks and notes""
Plug 'mattn/calendar-vim'
Plug 'sedm0784/vim-you-autocorrect'
" :TW
" Plug 'blindFS/vim-taskwarrior'

""Misc
" Smooth scrolling
"Plug 'psliwka/vim-smoothie'
Plug 'tyru/caw.vim'  " Better documentation
" Plug 'kkoomen/vim-doge' " Documentation generator
Plug 'wellle/context.vim' " Add context base inline
"Plug 'wellle/targets.vim' " Extends targets for ci, vi etc
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
Plug 'tpope/vim-scriptease'
Plug 'kyazdani42/nvim-web-devicons'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug '~/code/rich-markdown.nvim'
Plug 'christoomey/vim-tmux-navigator'

" All of your Plugins must be added before the following line
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
      \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \|   PlugInstall --sync | q
      \| endif

