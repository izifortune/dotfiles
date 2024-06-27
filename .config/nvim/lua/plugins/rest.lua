return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    enabled = false,
    dependencies = { "luarocks.nvim" },
    config = function()
      require("rest-nvim").setup()
    end,
    keys = {
      {
        "<leader>rr",
        "<cmd>Rest run<cr>",
        desc = "RestNvim: Send request",
      },
      {
        "<leader>rl",
        "<cmd>Rest run last<cr>",
        desc = "RestNvim: Send last",
      },
    },
    formatters = {
      json = "jq",
      xml = "xq",
      html = function(body)
        if vim.fn.executable("tidy") == 0 then
          return body, { found = false, name = "tidy" }
        end
        local fmt_body = vim.fn
          .system({
            "tidy",
            "-i",
            "-q",
            "--tidy-mark",
            "no",
            "--show-body-only",
            "auto",
            "--show-errors",
            "0",
            "--show-warnings",
            "0",
            "-",
          }, body)
          :gsub("\n$", "")

        return fmt_body, { found = true, name = "tidy" }
      end,
    },
  },
  -- "rest-nvim/rest.nvim",
  -- branch = "main",
  -- requires = { "nvim-lua/plenary.nvim" },
  -- keys = {
  --   {
  --     "<leader>rr",
  --     "<cmd>Rest run<cr>",
  --     desc = "RestNvim: Send request",
  --   },
  --   {
  --     "<leader>rp",
  --     "<Plug>RestNvimPreview<cr>",
  --     desc = "RestNvim: Preview request",
  --   },
  --   {
  --     "<leader>re",
  --     "<Plug>RestSelectEnv",
  --     desc = "RestNvim: Select env",
  --   },
  -- },
  -- config = function()
  --   require("rest-nvim").setup({
  --     skip_ssl_verification = true,
  --     custom_dynamic_variables = {
  --       -- add new dynamic variable function`
  --       ["$startDate"] = function()
  --         local os_date = os.date("%Y-%m-%d", os.time() + 24 * 60 * 60)
  --         return os_date
  --       end,
  --       ["$endDate"] = function()
  --         local os_date = os.date("%Y-%m-%d", os.time() + 48 * 60 * 60)
  --         return os_date
  --       end,
  --     },
  --     result = {
  --       -- toggle showing URL, HTTP info, headers at top the of result window
  --       show_url = true,
  --       -- show the generated curl command in case you want to launch
  --       -- the same request via the terminal (can be verbose)
  --       show_curl_command = false,
  --       show_http_info = true,
  --       show_headers = true,
  --       -- executables or functions for formatting response body [optional]
  --       -- set them to false if you want to disable them
  --       formatters = {
  --         json = "jq",
  --         xml = "xq",
  --         html = "htmlq",
  --       },
  --     },
  --   })
  -- end,
}
