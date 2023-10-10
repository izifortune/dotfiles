return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
      {
        "Marskey/telescope-sg",
        build = "npm install --global @ast-grep/cli",
      },
      "aaronhallaert/advanced-git-search.nvim",
      "molecule-man/telescope-menufacture",
      {
        "rmagatti/session-lens",
        config = function()
          require("session-lens").setup({
            path_display = { "shorten" },
          })
        end,
      },
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
        require("telescope").load_extension("live_grep_args")
        require("telescope").load_extension("advanced_git_search")
        require("telescope").load_extension("menufacture")
        require("telescope").load_extension("session-lens")
      end,
    },
    keys = {
      {
        "<C-p>",
        function()
          require("telescope").extensions.menufacture.find_files()
        end,
        desc = "Find files",
      },
      {
        "\\",
        "<cmd>lua require('telescope.builtin').resume(require('telescope.themes').get_ivy({}))<cr>",
        desc = "Telescope menu",
      },
      {
        "<leader>fp",
        function()
          require("telescope.builtin").grep_string({
            short_path = true,
            search = vim.fn.input("Grep String > "),
          })
        end,
      },
      {
        "<leader>fj",
        function()
          require("telescope").extensions.live_grep_args.live_grep_args()
        end,
      },
      {
        "<leader>fc",
        function()
          require("telescope").extensions.ast_grep.ast_grep({})
        end,
        desc = "Ast Grep",
      },
      {
        "<leader>fg",
        "<cmd>AdvancedGitSearch<cr>",
        desc = "AdvancedGitSearch",
      },
      {
        "<leader>fa",
        function()
          require("telescope.builtin").find_files({ cwd = "~/.config/nvim/lua/" })
        end,
        desc = "Find Plugin File",
      },
      {
        "<leader>fs",
        function()
          require("session-lens").search_session()
        end,
        desc = "Find Session",
      },
      {
        "<leader>fp",
        function()
          require("telescope.builtin").grep_string({
            short_path = true,
            search = vim.fn.input("Grep String > "),
          })
        end,
        desc = "Grep files",
      },
      {
        "<leader>fh",
        function()
          require("telescope.builtin").find_files({
            cwd = "~/code/knowledge/content/http-collections/",
          })
        end,
        desc = "Find http collections",
      },
    },
    -- change some options
    opts = {
      extensions = {
        ast_grep = {
          command = {
            "sg",
            "--json=stream",
          }, -- must have --json=stream
          grep_open_files = false, -- search in opened files
          lang = nil, -- string value, specify language for ast-grep `nil` for default
        },
        advanced_git_search = {
          dependencies = {
            -- fugitive or diffview
            diff_plugin = "diffview",
            -- Show builtin git pickers when executing "show_custom_functions" or :AdvancedGitSearch
            show_builtin_git_pickers = false,
          },
        },
      },

      pickers = {
        buffers = {
          mappings = {
            n = {
              ["<c-d>"] = require("telescope.actions").delete_buffer,
            }, -- n
            i = {
              ["<C-h>"] = "which_key",
              ["<c-d>"] = require("telescope.actions").delete_buffer,
            }, -- i
          }, -- mappings
        },
      },
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        mappings = {
          i = {
            ["<C-n>"] = function(arg)
              return require("telescope.actions").cycle_history_next(arg)
            end,
            ["<C-p>"] = function(arg)
              return require("telescope.actions").cycle_history_prev(arg)
            end,
            ["<C-j>"] = function(arg)
              return require("telescope.actions").move_selection_next(arg)
            end,
            ["<C-k>"] = function(arg)
              return require("telescope.actions").move_selection_previous(arg)
            end,
            ["<C-a>"] = function(arg)
              return require("telescope.actions").select_all(arg)
            end,
            ["<C-d>"] = function(arg)
              local actions = require("telescope.actions")
              return actions.send_selected_to_qflist(arg) + actions.open_qflist(arg)
            end,
          },
          n = {
            ["q"] = function(arg)
              return require("telescope.actions").close(arg)
            end,
          },
        },
      },
    },
  },
  {
    "aaronhallaert/advanced-git-search.nvim",
    config = function()
      -- optional: setup telescope before loading the extension
      require("telescope").setup({
        -- move this to the place where you call the telescope setup function
        extensions = {
          advanced_git_search = {
            dependencies = {
              -- fugitive or diffview
              diff_plugin = "diffview",
              -- Show builtin git pickers when executing "show_custom_functions" or :AdvancedGitSearch
              show_builtin_git_pickers = false,
            },
          },
        },
      })
      require("telescope").load_extension("advanced_git_search")
    end,
    dependencies = {
      "nvim-telescope/telescope.nvim",
      -- to show diff splits and open commits in browser
      "tpope/vim-fugitive",
      -- to open commits in browser with fugitive
      "tpope/vim-rhubarb", --- See dependencies
    },
  },
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   dependencies = {
  --     "aaronhallaert/advanced-git-search.nvim",
  --     config = function()
  --       -- optional: setup telescope before loading the extension
  --       require("telescope").setup({
  --         -- move this to the place where you call the telescope setup function
  --         extensions = {
  --           advanced_git_search = {
  --             dependencies = {
  --               -- fugitive or diffview
  --               diff_plugin = "diffview",
  --               -- Show builtin git pickers when executing "show_custom_functions" or :AdvancedGitSearch
  --               show_builtin_git_pickers = false,
  --             },
  --           },
  --         },
  --       })
  --     end,
  --   },
  -- },
}
