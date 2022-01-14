local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.cmd("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

return require("packer").startup(
function(use)
  -- Comment easy
  -- Have the file system follow you around
  use {"airblade/vim-rooter" }

  use {"alvan/vim-closetag" }
  use {"folke/which-key.nvim" }

  -- Theme
  use {"gruvbox-community/gruvbox" }


  -- tabline
  use {"itchyny/lightline.vim" }

  -- autopairs
  use {"windwp/nvim-autopairs" }

  -- Buffer bar in LUA
  use {"romgrk/barbar.nvim" }
  -- Buffer commands
  -- Split resie
  use {"simeji/winresizer" }
  -- Syntax highlight
  use {"nvim-treesitter/nvim-treesitter", run = ':TSUpdate'}
  -- MaximazeToggle
  use {"szw/vim-maximizer" }
  -- Respect editorconfig
  use {"editorconfig/editorconfig-vim" }
  use {"godlygeek/tabular" }
  use {"tpope/vim-surround" }
  use {"mattn/emmet-vim", ft = 'html'  }
  use {"othree/html5.vim", ft = 'html'  }

  -- Testing telescope should be removed for telescope
  use {"junegunn/fzf", run = ':call fzf#install()' }
  use {"junegunn/fzf.vim" }

  -- alt-enter to track remote branch
  use {"iamcco/markdown-preview.nvim", run = ':call mkdp#util#install()'}
  use {"jparise/vim-graphql" }
  use {"ryanoasis/vim-devicons" }
  -- Icons on complention
  use {"onsails/lspkind-nvim" }
  -- Debugging
  use {"puremourning/vimspector" }
  use {"mfussenegger/nvim-dap" }
  use {"rcarriga/nvim-dap-ui" }

  use {"unblevable/quick-scope" }
  -- Formatting on save
  use {"kosayoda/nvim-lightbulb" }

  use {"numToStr/Comment.nvim" }

  --LSP
  use {"RishabhRD/nvim-lsputils" }
  use {"neovim/nvim-lspconfig" }

  -- To be configured yet
  use {"jose-elias-alvarez/null-ls.nvim" }
  -- Display signature when typing hiding with C-x
  use {"ray-x/lsp_signature.nvim" }

  use {"RishabhRD/popfix" }
  use {"nvim-lua/popup.nvim" }
  use {"nvim-lua/plenary.nvim" }

  -- Frecency dep
  use {"tami5/sqlite.lua" }

  use {"nvim-telescope/telescope.nvim" }
  use {"nvim-telescope/telescope-fzf-writer.nvim" }
  use {"nvim-telescope/telescope-fzy-native.nvim" }
  use {"kyazdani42/nvim-tree.lua" }
  -- To remove once null-ls
  use {"jose-elias-alvarez/null-ls.nvim" }
  use {"izifortune/neuron.nvim", branch = 'feat/fix-mappings'}
  use {"nvim-telescope/telescope-frecency.nvim" }

  -- autocomplete
  use {"hrsh7th/cmp-nvim-lsp" }
  use {"hrsh7th/cmp-buffer" }
  use {"hrsh7th/nvim-cmp" }
  use {"hrsh7th/cmp-path" }
  use {"hrsh7th/cmp-calc" }

  -- snips integration
  use {"hrsh7th/cmp-vsnip" }
  use {"hrsh7th/vim-vsnip" }
  use {"rafamadriz/friendly-snippets" }

  -- Icons
  use {"onsails/lspkind-nvim" }

  use {"mhinz/vim-startify" }
  use {"dhruvasagar/vim-table-mode" }
  use {"chrisbra/csv.vim" }
  use {"tpope/vim-repeat" }

  -- Quickfix helpers
  -- :Reject :Restore
  -- :help vim-qf
  use {"romainl/vim-qf" }

  -- Split or join line
  -- gS or gJ
  use {"AndrewRadev/splitjoin.vim" }

  use {"akinsho/toggleterm.nvim" }

  --"GIT STUFF""
  -- :G goodies
  use {"tpope/vim-fugitive" }
  use {"TimUntersberger/neogit" }
  -- Git branch viewer :Flog :FlogSplit
  use {"rbong/vim-flog" }
  use {"lewis6991/gitsigns.nvim" }
  use {"izifortune/weblink.vim" }
  use {"sindrets/diffview.nvim" }
  -- Fancy gutters display issue with performance

  --"Focus ""
  use {"junegunn/limelight.vim" }
  use {"junegunn/goyo.vim" }

  -- Writing
  use {"reedes/vim-colors-pencil" }
  use {"rhysd/vim-grammarous" }
  use {"Ron89/thesaurus_query.vim", ft = 'markdown' }
  use {"junegunn/vim-easy-align" }
  --" Relax
  -- :VimGameCodeBreak
  use {"johngrib/vim-game-code-break" }
  --" UML
  use {"aklt/plantuml-syntax" }
  use {"weirongxu/plantuml-previewer.vim" }
  use {"tyru/open-browser.vim" }
  use {"chrisbra/Colorizer" }

  --"Language utils
  use {"lervag/vimtex", ft = 'latex' }
  use {"SidOfc/mkdx", ft = 'markdown' }
  use {"izifortune/follow-markdown-links" }
  use {"reedes/vim-wordy" } -- Verify quality of writting (see :Wordy) }
  use {"dpelle/vim-LanguageTool" }
  use {"RishabhRD/nvim-cheat.sh" }

  --"Tasks and notes""
  use {"mattn/calendar-vim" }
  use {"kristijanhusak/orgmode.nvim" }

  use {"tyru/caw.vim" }  -- Better documentation }
  use {"wellle/context.vim" } -- Add context base inline }
  use {"wellle/targets.vim" } -- Extends targets for ci, vi etc }
  use {"ThePrimeagen/vim-be-good", run =  './install.sh'}
  use {"tpope/vim-scriptease" }
  use {"kyazdani42/nvim-web-devicons" }
  use {"christoomey/vim-tmux-navigator" }


  -- Adding command :Trouble
  use {"folke/trouble.nvim" }
  use {"ThePrimeagen/refactoring.nvim" }
  use {"nvim-treesitter/playground" }
end
)
