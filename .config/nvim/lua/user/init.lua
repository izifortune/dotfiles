--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {
  -- Set colorscheme to use
  colorscheme = "gruvbox",
  options = {
    opt = {
      -- set to true or false etc.
      relativenumber = true, -- sets vim.opt.relativenumber
      number = true,         -- sets vim.opt.number
      spell = false,         -- sets vim.opt.spell
      signcolumn = "auto",   -- sets vim.opt.signcolumn to auto
      wrap = false,          -- sets vim.opt.wrap
      foldenable = false,
    },
    g = {
      mapleader = " ",                   -- sets vim.g.mapleader
      autoformat_enabled = true,         -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
      cmp_enabled = true,                -- enable completion at start
      autopairs_enabled = true,          -- enable autopairs at start
      diagnostics_enabled = true,        -- enable diagnostics at start
      status_diagnostics_enabled = true, -- enable diagnostics in statusline
      icons_enabled = true,              -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
      ui_notifications_enabled = true,   -- disable notifications when toggling UI elements
    },
  },
  -- If you need more control, you can use the function()...end notation
  -- options = function(local_vim)
  --   local_vim.opt.relativenumber = true
  --   local_vim.g.mapleader = " "
  --   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
  --   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
  --
  --   return local_vim
  -- end,

  -- Set dashboard header
  header = {
    " █████  ███████ ████████ ██████   ██████",
    "██   ██ ██         ██    ██   ██ ██    ██",
    "███████ ███████    ██    ██████  ██    ██",
    "██   ██      ██    ██    ██   ██ ██    ██",
    "██   ██ ███████    ██    ██   ██  ██████",
    " ",
    "    ███    ██ ██    ██ ██ ███    ███",
    "    ████   ██ ██    ██ ██ ████  ████",
    "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
    "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
    "    ██   ████   ████   ██ ██      ██",
  },
  -- Extend LSP configuration
  lsp = {
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true,     -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          "yaml",
          "php",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        "eslint",
        "tsserver",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    capabilities = {
      textDocument = {
        foldingRange = {
          dynamicRegistration = false,
          lineFoldingOnly = true,
        },
      },
    },
    -- add to the global LSP on_attach function
    -- on_attach = function(client, bufnr) require("ufo").setup() end,
    -- easily add or disable built in mappings added during LSP attaching
    mappings = {
      n = {
        -- ["<leader>lf"] = false -- disable formatting keymap
      },
    },
    -- add to the global LSP on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the mason server-registration function
    -- server_registration = function(server, opts)
    --   require("lspconfig")[server].setup(opts)
    -- end,

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      -- tsserver = {
      --   root_dir = require("lspconfig").util.root_pattern ".git",
      -- },
      ["cucumber_language_server"] = {
        cucumber = {
          features = {
            "**/*.feature",
          },
          glue = {
            "**/*.steps-definition.ts",
            "**/*.steps.ts",
            "**/*.steps.js",
          },
        },
      },
      -- example for addings schemas to yamlls
      -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },
    },
  },
  -- Mapping data with "desc" stored directly by vim.keymap.set().
  --
  -- Please use this mappings table to set keyboard mapping since this is the
  -- lower level configuration and more robust one. (which-key will
  -- automatically pick-up stored data by this setting.)
  mappings = {
    -- first key is the mode
    n = {
      -- second key is the lefthand side of the map
      -- mappings seen under group name "Buffer"
      ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
      ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
      ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
      ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
      ["<leader>bo"] = { "<cmd>%bd|e#<cr>", desc = "Close all except current" },
      ["<leader>cO"] = { ":!git checkout --ours -- %<cr>", desc = "Choose all OURS for the file" },
      ["<leader>cT"] = { ":!git checkout --theirs -- %<cr>", desc = "Choose all THEIRS for the file" },
      -- Telescope addition
      ["<leader>fp"] = {
        function()
          require("telescope.builtin").grep_string {
            short_path = true,
            search = vim.fn.input "Grep String > ",
          }
        end,
        desc = "Grep Word > ",
      },
      ["<leader>fz"] = { ":ZkNotes<cr>", desc = "Search zettel" },
      --
      ["<leader>e"] = false,
      ["<leader>ee"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
      ["<leader>ef"] = { "<cmd>Neotree focus<cr>", desc = "Focus Explorer" },
      ["<leader>er"] = { "<cmd>Neotree reveal<cr>", desc = "Reveal Explorer" },
      ["<leader>fO"] = { require("user.telescope").org, desc = "Find Org" },
      ["<leader>nz"] = {
        function()
          vim.api.nvim_command ':execute ":e ~/code/knowledge/content/zettelkasten/" . strftime("%Y%m%d%H%M%S") . ".md"'
        end,
        desc = "New Zettel",
      },
      ["<C-p>"] = { "<cmd>Telescope find_files<cr>", desc = "Find files" },
      -- Utilities
      ["<Tab>"] = { ":bnext<cr>", silent = true },
      ["<S-Tab>"] = { ":bNext<cr>", silent = true },
      ["s"] = { "<cmd>Pounce<cr>", silent = true },
      ["S"] = { "<cmd>PounceRepeat<cr>", silent = true },
      ["<leader>cd"] = { ":cd %:p:h<cr>", desc = "Change directory to file" },
      -- Org
      ["<leader>o"] = false,
      -- quick save
      -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
      -- ["<leader>ma"] = { require("grapple").toggle, desc = "Grapple Toggle" },
      -- ["<leader>mp"] = { require("grapple").popup_tags, desc = "Grapple Popup" },
      -- ["<leader>mj"] = {
      --   function() require("grapple").select { key = "Last" } end,
      --   desc = "Grapple named select",
      -- },
      -- ["<leader>mJ"] = {
      --   function() require("grapple").toggle { key = "Last" } end,
      --   desc = "Grapple named toggle",
      -- },
    },
    i = {
      ["<C-l>"] = { "<C-g>u<Esc>[s1z=`]a<C-g>u", desc = "Fix spelling", silent = true },
    },
    t = {
      -- setting a mapping to false will disable it
      -- ["<esc>"] = false,
    },
  },
  -- Configure plugins
  plugins = {
    -- You can disable default plugins as follows:
    -- ["goolord/alpha-nvim"] = { disable = true },

    -- You can also add new plugins here as well:
    -- Add plugins, the packer syntax without the "use"
    -- { "andweeb/presence.nvim" },
    -- {
    --   "ray-x/lsp_signature.nvim",
    --   event = "BufRead",
    --   config = function()
    --     require("lsp_signature").setup()
    --   end,
    -- },

    -- We also support a key value style plugin definition similar to NvChad:
    -- ["ray-x/lsp_signature.nvim"] = {
    --   event = "BufRead",
    --   config = function()
    --     require("lsp_signature").setup()
    --   end,
    -- },
    { "ellisonleao/gruvbox.nvim", lazy = false },
    {
      "mickael-menu/zk-nvim",
      config = function() require("zk").setup() end,
      cmd = { "ZkNotes" },
    },
    { "rlane/pounce.nvim",        lazy = false },
    {
      "nvim-orgmode/orgmode",
      config = function() require "user.orgmode" end,
      lazy = false,
    },
    {
      "kylechui/nvim-surround",
      config = function() require("nvim-surround").setup() end,
      lazy = false,
    },
    { "dhruvasagar/vim-table-mode", lazy = false },
    -- { "kevinhwang91/nvim-bqf" },
    {
      "iamcco/markdown-preview.nvim",
      event = "BufRead",
      build = function() vim.fn["mkdp#util#install"]() end,
    },
    { "mechatroner/rainbow_csv",    ft = "csv" },
    { "MunifTanjim/nui.nvim",       lazy = false },
    {
      "jackMort/ChatGPT.nvim",
      cmd = { "ChatGPT" },
      config = function() require("chatgpt").setup {} end,
      dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
      },
    },
    { "izifortune/weblink.vim" },
    { "aklt/plantuml-syntax",        ft = "uml" },
    { "shortcuts/no-neck-pain.nvim", cmd = { "NoNeckPain" } },
    { "sindrets/diffview.nvim",      lazy = false },
    { "gennaro-tedesco/nvim-jqx" },
    -- {
    --   "chrisgrieser/nvim-recorder",
    --   config = function() require("recorder").setup() end,
    -- },
    { "echasnovski/mini.nvim",       run = function() require("mini.bracketed").setup() end, lazy = false },
    -- { "cbochs/grapple.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    -- { "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async" },
    -- All other entries override the require("<key>").setup({...}) call for default plugins
    ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
      -- config variable is the default configuration table for the setup function call
      local null_ls = require "null-ls"

      -- Check supported formatters and linters
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      config.sources = {
        -- Set a formatter
        -- null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
      }
      return config -- return final config table
    end,
    treesitter = {
      -- overrides `require("treesitter").setup(...)`
      ensure_installed = { "lua", "typescript", "org", "html", "css" },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "org" }, -- Required for spellcheck, some LaTex highlights and code block highlights that do not have ts grammar
      },
    },
    {
      "nvim-telescope/telescope.nvim",
      dependencies = { -- add a new dependency to telescope that is our new plugin
        "nvim-telescope/telescope-media-files.nvim",
      },
      -- the first parameter is the plugin specification
      -- the second is the table of options as set up in Lazy with the `opts` key
      config = function(plugin, opts)
        -- run the core AstroNvim configuration function with the options table
        require "plugins.configs.telescope" (plugin, opts)

        -- require telescope and load extensions as necessary
        --
        local telescope = require "telescope"
        telescope.load_extension "media_files"

        local actions = require "telescope.actions"
        telescope.setup {
          defaults = {
            mappings = {
              i = {
                ["<C-n>"] = actions.cycle_history_next,
                ["<C-p>"] = actions.cycle_history_prev,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-a>"] = actions.select_all,
                ["<C-s>"] = actions.send_selected_to_qflist + actions.open_qflist,
              },
              n = { ["q"] = actions.close },
            },
          },
        }
      end,
    },
    telescope = function()
    end,
    -- use mason-lspconfig to configure LSP installations
    ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
      ensure_installed = {
        "sumneko_lua",
        "tsserver",
        "eslint",
        "html",
        "cucumber_language_server",
        -- "bash_language_server",
      },
    },
    -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
    ["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
      ensure_installed = { "prettier", "stylua" },
      automatic_setup = true,
    },
    {
      -- override nvim-autopairs plugin
      "hrsh7th/nvim-cmp",
      -- override the options table that is used in the `require("cmp").setup()` call
      opts = function(_, opts)
        -- opts parameter is the default options table
        -- the function is lazy loaded so cmp is able to be required
        local cmp = require "cmp"
        -- modify the sources part of the options table
        opts.sources = cmp.config.sources {
          { name = "nvim_lsp", priority = 1000 },
          { name = "luasnip",  priority = 750 },
          { name = "buffer",   priority = 500 },
          { name = "path",     priority = 250 },
        }

        -- return the new table to be used
        return opts
      end,
    },
  },
  -- LuaSnip Options
  luasnip = {
    -- Extend filetypes
    filetype_extend = {
      -- javascript = { "javascriptreact" },
    },
    -- Configure luasnip loaders (vscode, lua, and/or snipmate)
    vscode = {
      -- Add paths for including more VS Code style snippets in luasnip
      paths = {},
    },
  },
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
    -- Restore cursor last position
    vim.cmd [[
        autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
    ]]
    -- include functions
    require "user.functions"
  end,
}

return config
