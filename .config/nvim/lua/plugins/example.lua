-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
-- if true then return {} end

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  -- Configure LazyVim to load gruvbox
  -- change trouble config
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },
  --
  -- -- disable trouble
  -- { "folke/trouble.nvim", enabled = false },

  -- add symbols-outline
  -- {
  --   "simrat39/symbols-outline.nvim",
  --   cmd = "SymbolsOutline",
  --   keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
  --   config = true,
  -- },

  -- change some telescope options and a keymap to browse plugin files

  -- add telescope-fzf-native
  -- add tsserver and setup with typescript.nvim instead of lspconfig
  -- {
  --   "neovim/nvim-lspconfig",
  --   dependencies = {
  --     "jose-elias-alvarez/typescript.nvim",
  --     init = function()
  --       require("lazyvim.util").lsp.on_attach(function(_, buffer)
  --         -- stylua: ignore
  --         vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
  --         vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
  --       end)
  --     end,
  --   },
  --   opts = function(_, opts)
  --     opts.servers.vtsls.settings.vtsls.autoUseWorkspaceTsdk = true
  --     opts.servers.vtsls.init_options = {hostInfo = 'neovim' }
  --     return opts
  --   end,
  -- },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      function file_exists(name)
        local f=io.open(name,"r")
        if f~=nil then io.close(f) return true else return false end
      end

      -- opts.servers.typescript.init_options = {
      --   hostInfo = "neovim",
      --   maxTsServerMemory = 18432,
      --   preferences = {
      --     importModuleSpecifierPreference = "relative"
      --   }
      -- }
      opts.servers.vtsls.init_options = { hostInfo = "neovim" }
      opts.servers.vtsls.autoUseWorkspaceTsdk = true
      opts.servers.vtsls.root_dir = function()
        local lazyvimRoot = require("lazyvim.util.root")
        return lazyvimRoot.git()
      end
      if file_exists(opts.servers.vtsls.root_dir() .. "/.yarn/sdks/typescript/lib") then
        opts.servers.vtsls.settings.typescript.tsdk = ".yarn/sdks/typescript/lib"
      end
      -- opts.servers.vtsls.settings.typescript.tsdk = '.yarn/sdks/typescript/lib'
      return opts
    end,
    -- opts = {
    --   inlay_hints = { enabled = false },
    --   servers = {
    --     vtsls = {
    --       init_options = { hostInfo = "neovim" },
    --       settings = {
    --         typescript = {
    --           -- tsdk = "../../.yarn/sdks/typescript/lib",
    --         },
    --       },
    --     },
    --   },
    --   setup = {
    --     vtsls = function(_, _opts)
    --       require("lazyvim.util").lsp.on_attach(function(client)
    --         if client.name == "vtsls" then
    --           client.server_capabilities.documentFormattingProvider = false
    --         end
    --       end)
    --     end,
    --   },
    -- },
    -- keys = {
    --   {
    --     '<leader>tt',
    --     function()
    --       require('plugins.lsp.utils').execute({command = 'typescript.selectTypeScriptVersion'})
    --     end,
    --     desc = 'Select typescript version',
    --   },
    -- },
  },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "http",
        "graphql",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "http",
        "typescript",
        "vim",
        "yaml",
        "org"
      },
    },
  },

  -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- would overwrite `ensure_installed` with the new value.
  -- If you'd rather extend the default config, use the code below instead:
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
      })
    end,
  },

  -- -- the opts function can also be used to change the default opts:
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   event = "VeryLazy",
  --   opts = function(_, opts)
  --     table.insert(opts.sections.lualine_x, "😄")
  --   end,
  -- },
  --
  -- -- or you can return new options to override all the defaults
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   event = "VeryLazy",
  --   opts = function()
  --     return {
  --       --[[add your custom lualine config here]]
  --     }
  --   end,
  -- },

  -- use mini.starter instead of alpha
  -- { import = "lazyvim.plugins.extras.ui.mini-starter" },

  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "angular-language-server",
        "bash-language-server",
        "emmet-ls",
        "eslint-lsp",
        "fixjson",
        "jq",
        "jq-lsp",
        "json-lsp",
        "lua-language-server",
        "marksman",
        "prettier",
        "prettierd",
        "shellcheck",
        "shfmt",
        "typescript-language-server",
        "vtsls",
        "yaml-language-server"
      },
    },
  },

  -- Use <tab> for completion and snippets (supertab)
  -- first: disable default <tab> and <s-tab> behavior in LuaSnip
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    -- follow latest release.
    version = "1.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    keys = function()
      return {}
    end,
    build = "make install_jsregexp",
    config = function(_)
      require("luasnip.loaders.from_vscode").lazy_load { paths = { "./lua/snippets" } } -- load snippets paths
    end,
  },
  -- {
  --   "L3MON4D3/LuaSnip",
  --   keys = function()
  --     return {}
  --   end,
  -- },
}
