" Comment easy
" Have the file system follow you around
Plug 'alvan/vim-closetag'
Plug 'folke/which-key.nvim'

" Theme
Plug 'gruvbox-community/gruvbox'


" tabline
" Plug 'itchyny/lightline.vim'
" Plug 'windwp/windline.nvim'

" autopairs
Plug 'windwp/nvim-autopairs'

" Buffer bar (TOP) in LUA
Plug 'romgrk/barbar.nvim'
" Buffer commands
" Split resie
Plug 'simeji/winresizer'
" Syntax highlight
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
" SymbolsOutline
Plug 'simrat39/symbols-outline.nvim'
" MaximazeToggle
Plug 'szw/vim-maximizer'
" Respect editorconfig
Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular'
" Plug 'tpope/vim-surround'
Plug 'kylechui/nvim-surround'
Plug 'mattn/emmet-vim', { 'for': 'html'  } " Zen coding at it's best"
Plug 'othree/html5.vim', { 'for': 'html'  }

" Testing telescope should be removed for telescope
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'

" Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
" alt-enter to track remote branch
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
Plug 'jparise/vim-graphql'
Plug 'ryanoasis/vim-devicons'
" Icons on complention
Plug 'onsails/lspkind-nvim'
" Debugging
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'jbyuki/one-small-step-for-vimkind'
Plug 'mxsdev/nvim-dap-vscode-js'

" ISSUE ABOVE"

Plug 'unblevable/quick-scope'
" Formatting on save
" Plug 'kosayoda/nvim-lightbulb'

" Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'numToStr/Comment.nvim'

"LSP
Plug 'RishabhRD/nvim-lsputils'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'b0o/schemastore.nvim'
Plug 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'

" Display signature when typing hiding with C-x
Plug 'ray-x/lsp_signature.nvim'

Plug 'RishabhRD/popfix'
" Plug 'anott03/nvim-lspinstall'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

" Frecency dep
Plug 'tami5/sqlite.lua'

Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'rudism/telescope-dict.nvim'
" Plug 'fhill2/telescope-ultisnips.nvim'
Plug 'kyazdani42/nvim-tree.lua'
" To remove once null-ls
Plug 'jose-elias-alvarez/null-ls.nvim'
" Plug 'dense-analysis/ale'
" Plug 'mfussenegger/nvim-lint'
" Plug 'nvim-telescope/telescope-frecency.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-dap.nvim'
" Plug 'axkirillov/easypick.nvim'

" :Startify
Plug 'mhinz/vim-startify'
" || 
Plug 'dhruvasagar/vim-table-mode'
Plug 'tpope/vim-repeat'

" Quickfix helpers
" :Reject :Restore
" :help vim-qf
" Conflict with trouble
" Plug 'romainl/vim-qf'

" Split or join line
" gS or gJ
Plug 'AndrewRadev/splitjoin.vim'

Plug 'akinsho/toggleterm.nvim'
" Plug 'mhartington/formatter.nvim'

""GIT STUFF""
" :G goodies
Plug 'tpope/vim-fugitive'
Plug 'TimUntersberger/neogit'
" Git branch viewer :Flog :FlogSplit
Plug 'rbong/vim-flog'
Plug 'lewis6991/gitsigns.nvim'
Plug 'izifortune/weblink.vim'
Plug 'sindrets/diffview.nvim'
" Fancy gutters display issue with performance
" Plug 'airblade/vim-gitgutter'

""Focus ""
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'

" Writing
Plug 'reedes/vim-colors-pencil'
Plug 'rhysd/vim-grammarous'
Plug 'Ron89/thesaurus_query.vim', { 'for': 'markdown' }
Plug 'junegunn/vim-easy-align'
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
" Plug 'izifortune/follow-markdown-links'
Plug 'reedes/vim-wordy' " Verify quality of writting (see :Wordy)
Plug 'dpelle/vim-LanguageTool'
Plug 'RishabhRD/nvim-cheat.sh'

""Tasks and notes""
" Plug 'mattn/calendar-vim'
Plug 'nvim-orgmode/orgmode'

Plug 'tyru/caw.vim'  " Better documentation
" Plug 'wellle/context.vim' " Add context base inline :Context
"Plug 'wellle/targets.vim' " Extends targets for ci, vi etc
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
Plug 'tpope/vim-scriptease'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'christoomey/vim-tmux-navigator'

" Plug 'jbyuki/instant.nvim'

" Adding command :Trouble
Plug 'folke/trouble.nvim'
" :WinShift :direction
" :WinShift :swap
Plug 'sindrets/winshift.nvim'
Plug 'famiu/bufdelete.nvim'
" Plug 'rebelot/kanagawa.nvim'
" Plug 'ThePrimeagen/refactoring.nvim'
" Plug 'nvim-treesitter/playground'

" Plug 'github/copilot.vim'
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'Einenlum/yaml-revealer'
Plug 'elihunter173/dirbuf.nvim'
" Plug 'renerocksai/telekasten.nvim'
Plug 'renerocksai/calendar-vim'
Plug 'danymat/neogen'
Plug 'windwp/nvim-spectre'
Plug 'mzlogin/vim-markdown-toc'
" Regex explainer
Plug 'MunifTanjim/nui.nvim'
Plug 'bennypowers/nvim-regexplainer'

" Plug 'williamboman/nvim-lsp-installer'
" Plug 'brymer-meneses/grammar-guard.nvim'
" Plug 'mrjones2014/legendary.nvim' 
Plug 'stevearc/dressing.nvim'
Plug 'David-Kunz/jester'
Plug 'vim-test/vim-test'
Plug 'rhysd/conflict-marker.vim'
Plug 'echasnovski/mini.nvim'
Plug 'zane-/howdoi.nvim'
Plug 'ahmedkhalf/project.nvim'
Plug 'vimpostor/vim-tpipeline'
Plug 'anuvyklack/hydra.nvim'
Plug 'anuvyklack/keymap-layer.nvim'
" Plug 'tweekmonster/startuptime.vim'
Plug 'dstein64/vim-startuptime'
" Plug 'feline-nvim/feline.nvim'
Plug 'SmiteshP/nvim-navic'
" Plug 'ggandor/lightspeed.nvim'
Plug 'rlane/pounce.nvim'
Plug 'akinsho/org-bullets.nvim'
Plug 'AlphaTechnolog/pywal.nvim', { 'as': 'pywal' }
Plug 'norcalli/nvim-colorizer.lua'
" TODO move
" Plug 'vimwiki/vimwiki'
" Plug 'michal-h21/vim-zettel'
" let g:vimwiki_list = [{'path': '~/code/knowledge/content/zettelkasten',
"                       \ 'syntax': 'markdown', 'ext': '.md'}]
" let g:nv_search_paths = ['~/code/knowledge/content/zettelkasten']
" Plug 'renerocksai/telekasten.nvim'
Plug 'mickael-menu/zk-nvim'
" Plug 'izifortune/neuron.nvim'
Plug 'vuki656/package-info.nvim'
Plug 'samoshkin/vim-mergetool'

" Startup perf
Plug 'lewis6991/impatient.nvim'
" Plug 'nathom/filetype.nvim'

"bookmarks
Plug 'dhruvmanila/telescope-bookmarks.nvim'
" Plug 'tami5/sqlite.lua'
Plug 'luisiacc/gruvbox-baby', {'branch': 'main'}
Plug 'kevinhwang91/nvim-ufo'
Plug 'kevinhwang91/promise-async'
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'michaelb/sniprun', {'do': 'bash install.sh'}
Plug 'vigoux/ltex-ls.nvim'
Plug 'someone-stole-my-name/yaml-companion.nvim'
Plug 'gennaro-tedesco/nvim-jqx'
Plug  'smjonas/live-command.nvim'
