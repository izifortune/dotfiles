return {
  "epwalsh/obsidian.nvim",
  lazy = false,
  event = {
    "BufReadPre ~/code/vault/**.md",
    "BufNewFile ~/code/vault/**.md",
  },
  -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
  -- event = { "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md" },
  -- cmd = { "ObsidianSearch", "ObsidianToday", "ObsidianYesterday", "" },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- Optional, for completion.
    "hrsh7th/nvim-cmp",

    -- Optional, for search and quick-switch functionality.
    "nvim-telescope/telescope.nvim",

    -- Optional, an alternative to telescope for search and quick-switch functionality.
    -- "ibhagwan/fzf-lua"

    -- Optional, another alternative to telescope for search and quick-switch functionality.
    -- "junegunn/fzf",
    -- "junegunn/fzf.vim"

    -- Optional, alternative to nvim-treesitter for syntax highlighting.
    "godlygeek/tabular",
    "preservim/vim-markdown",
  },
  keys = {
    {
      "<leader>fo",
      ":ObsidianSearch<cr>",
      desc = "Find obsidian notes",
    },
  },
  opts = {
    workspaces = {
      {
        name = "work",
        path = "~/code/vault", -- no need to call 'vim.fn.expand' here
      },
    },
    -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
    -- URL it will be ignored but you can customize this behavior here.
    follow_url_func = function(url)
      -- Open the URL in the default web browser.
      vim.fn.jobstart({ "open", url }) -- Mac OS
      -- vim.fn.jobstart({"xdg-open", url})  -- linux
    end,

    -- Optional, set to true if you use the Obsidian Advanced URI plugin.
    -- https://github.com/Vinzent03/obsidian-advanced-uri
    use_advanced_uri = true,
    completion = {
      -- If using nvim-cmp, otherwise set to false
      nvim_cmp = true,
      -- Trigger completion at 2 chars
      min_chars = 2,
    },
    notes_subdir = "notes",
    daily_notes = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = "dailies",
      -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
      template = "daily.template.md",
    },
    -- Optional, for templates (see below).
    templates = {
      subdir = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
      -- A map for custom variables, the key should be the variable and the value a function
      substitutions = {},
    },
  },
  -- config = function(_, opts)
  --   require("obsidian").setup(opts)
  --
  --   -- Optional, override the 'gf' keymap to utilize Obsidian's search functionality.
  --   -- see also: 'follow_url_func' config option below.
  --   vim.keymap.set("n", "gf", function()
  --     if require("obsidian").util.cursor_on_markdown_link() then
  --       return "<cmd>ObsidianFollowLink<CR>"
  --     else
  --       return "gf"
  --     end
  --   end, { noremap = false, expr = true })
  -- end,
}
