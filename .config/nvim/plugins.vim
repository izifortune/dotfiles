call plug#begin('~/.local/share/nvim/plugged')

" Comment easy
" Have the file system follow you around
Plug 'airblade/vim-rooter'

Plug 'alvan/vim-closetag'
Plug 'folke/which-key.nvim'

" Theme
Plug 'gruvbox-community/gruvbox'


" tabline
Plug 'itchyny/lightline.vim'

" autopairs
Plug 'windwp/nvim-autopairs'

" Buffer bar in LUA
Plug 'romgrk/barbar.nvim'
" Buffer commands
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
Plug 'mattn/emmet-vim', { 'for': 'html'  } " Zen coding at it's best"
Plug 'othree/html5.vim', { 'for': 'html'  }
Plug 'skwp/greplace.vim'

" Testing telescope should be removed for telescope
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
" alt-enter to track remote branch
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'jparise/vim-graphql'
Plug 'ryanoasis/vim-devicons'
" Icons on complention
Plug 'onsails/lspkind-nvim'
" Debugging
Plug 'puremourning/vimspector'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'

Plug 'unblevable/quick-scope'
" Formatting on save
Plug 'sbdchd/neoformat'
Plug 'kosayoda/nvim-lightbulb'

" Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'numToStr/Comment.nvim'

"LSP
Plug 'RishabhRD/nvim-lsputils'
Plug 'neovim/nvim-lspconfig'

" To be configured yet
Plug 'jose-elias-alvarez/null-ls.nvim'
" Display signature when typing hiding with C-x
Plug 'ray-x/lsp_signature.nvim'

Plug 'RishabhRD/popfix'
" Plug 'anott03/nvim-lspinstall'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-writer.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'fhill2/telescope-ultisnips.nvim'
Plug 'kyazdani42/nvim-tree.lua'
" To remove once null-ls
Plug 'dense-analysis/ale'
Plug 'izifortune/neuron.nvim', {'branch': 'feat/fix-mappings'} " (telescope)

" autocomplete
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-calc'
Plug 'f3fora/cmp-spell'
" For ultisnips user.
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
" Icons
Plug 'onsails/lspkind-nvim'

" COC related plugins
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

" Writing
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
Plug 'wellle/context.vim' " Add context base inline
"Plug 'wellle/targets.vim' " Extends targets for ci, vi etc
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
Plug 'tpope/vim-scriptease'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'christoomey/vim-tmux-navigator'

" Plug 'jbyuki/instant.nvim'

" Adding command :Trouble
Plug 'folke/trouble.nvim'
Plug 'vhyrro/neorg'
Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ThePrimeagen/refactoring.nvim'
Plug 'nvim-treesitter/playground'

" Plug 'vuki656/package-info.nvim'

" All of your Plugins must be added before the following line
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
      \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \|   PlugInstall --sync | q
      \| endif
