call plug#begin('~/.local/share/nvim/plugged')

" Comment easy
" Have the file system follow you around
Plug 'airblade/vim-rooter'
" Plug 'junegunn/rainbow_parentheses.vim'

Plug 'alvan/vim-closetag'
Plug 'folke/which-key.nvim'

" Theme
Plug 'gruvbox-community/gruvbox'
" Plug 'sainnhe/gruvbox-material'
" Plug 'lifepillar/vim-gruvbox8'


" tabline
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}

" autopairs
Plug 'windwp/nvim-autopairs'

" Buffer bar in LUA
Plug 'romgrk/barbar.nvim'
" Buffer commands
" Plug 'moll/vim-bbye'
" Split resie
Plug 'simeji/winresizer'
" Syntax highlight
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" MaximazeToggle
Plug 'szw/vim-maximizer'
" Respect editorconfig
Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-surround'
" Plug 'Raimondi/delimitMate'
Plug 'mattn/emmet-vim', { 'for': 'html'  } " Zen coding at it's best"
Plug 'othree/html5.vim', { 'for': 'html'  }
Plug 'skwp/greplace.vim'
" Testing telescope
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
" alt-enter to track remote branch
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'szymonmaszke/vimpyter' "vim-plug
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'jparise/vim-graphql'
Plug 'ryanoasis/vim-devicons'
" Icons on complention
Plug 'onsails/lspkind-nvim'
Plug 'puremourning/vimspector'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'unblevable/quick-scope'
Plug 'sbdchd/neoformat'
Plug 'kosayoda/nvim-lightbulb'

" Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'numToStr/Comment.nvim'

"LSP
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/lsp_signature.nvim'

" complention nvim
" Plug 'nvim-lua/completion-nvim'
" Plug 'aca/completion-tabnine', { 'do': './install.sh' }
" Plug 'steelsojka/completion-buffers'
" Plug 'nvim-treesitter/completion-treesitter'

Plug 'hrsh7th/nvim-compe'
" Too intensive on CPU
" Plug 'tzachar/compe-tabnine', { 'do': './install.sh' }


Plug 'RishabhRD/popfix'
" Plug 'anott03/nvim-lspinstall'
Plug 'RishabhRD/nvim-lsputils'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-writer.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'fhill2/telescope-ultisnips.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'dense-analysis/ale'
Plug 'sudormrfbin/cheatsheet.nvim'
" Plug 'kyazdani42/nvim-web-devicons' " for file icons
" Plug 'kyazdani42/nvim-tree.lua'
" Need to figure out how to work
" Plug 'kosayoda/nvim-lightbulb'
" Plug 'fiatjaf/neuron.vim' " FZF
Plug 'izifortune/neuron.nvim', {'branch': 'feat/fix-mappings'} " (telescope)

" autocomplete
" Plug 'hrsh7th/nvim-compe'

" COC related plugins
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
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

" Plug 'voldikss/vim-floaterm'
Plug 'akinsho/toggleterm.nvim'
" Plug 'mhartington/formatter.nvim'

""GIT STUFF""
" :G goodies
Plug 'tpope/vim-fugitive'
Plug 'TimUntersberger/neogit'
" Git branch viewer :Flog :FlogSplit
Plug 'rbong/vim-flog'
" Plug 'lambdalisue/gina.vim'
Plug 'izifortune/weblink.vim'
Plug 'lewis6991/gitsigns.nvim'
" Fancy gutters display issue with performance
" Plug 'airblade/vim-gitgutter'
Plug 'sindrets/diffview.nvim'

""Focus ""
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'

Plug 'reedes/vim-colors-pencil'
Plug 'rhysd/vim-grammarous'
Plug 'Ron89/thesaurus_query.vim', { 'for': 'markdown' }
Plug 'junegunn/vim-easy-align'
Plug 'jreybert/vimagit'
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
Plug 'kristijanhusak/orgmode.nvim'
" :TW
" Plug 'blindFS/vim-taskwarrior'

""Misc
" Smooth scrolling
"Plug 'psliwka/vim-smoothie'
Plug 'tyru/caw.vim'  " Better documentation
" Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
Plug 'wellle/context.vim' " Add context base inline
" Plug 'romgrk/nvim-treesitter-context'
"Plug 'wellle/targets.vim' " Extends targets for ci, vi etc
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
Plug 'tpope/vim-scriptease'
Plug 'kyazdani42/nvim-web-devicons'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug '~/code/rich-markdown.nvim'
Plug 'christoomey/vim-tmux-navigator'

" Plug 'jbyuki/instant.nvim'

" Adding command :Trouble
Plug 'folke/trouble.nvim'
" Plug 'ggandor/lightspeed.nvim'
Plug 'vhyrro/neorg'
Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ThePrimeagen/refactoring.nvim'
Plug 'nvim-treesitter/playground'

" All of your Plugins must be added before the following line
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
      \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \|   PlugInstall --sync | q
      \| endif
