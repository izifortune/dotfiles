return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<C-p>",
      "<cmd>Telescope find_files<cr>",
      desc = "Find files",
    },
    {
      ";",
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
      "<leader>fa",
      function()
        require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
      end,
      desc = "Find Plugin File",
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
  },
  -- change some options
  opts = {
    defaults = {
      -- layout_strategy = "horizontal",
      -- layout_config = { prompt_position = "top" },
      -- sorting_strategy = "ascending",
      -- winblend = 0,
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
}
