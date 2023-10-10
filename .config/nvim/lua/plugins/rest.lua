return {
  "rest-nvim/rest.nvim",
  requires = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<leader>rr",
      "<Plug>RestNvim<cr>",
      desc = "RestNvim: Send request",
    },
    {
      "<leader>rp",
      "<Plug>RestNvimPreview<cr>",
      desc = "RestNvim: Preview request",
    },
    {
      "<leader>re",
      "<Plug>RestSelectEnv",
      desc = "RestNvim: Select env",
    },
  },
  config = function()
    require("rest-nvim").setup({
      skip_ssl_verification = true,
      custom_dynamic_variables = {
        -- add new dynamic variable function`
        ["$startDate"] = function()
          local os_date = os.date("%Y-%m-%d", os.time() + 24 * 60 * 60)
          return os_date
        end,
        ["$endDate"] = function()
          local os_date = os.date("%Y-%m-%d", os.time() + 48 * 60 * 60)
          return os_date
        end,
      },
      result = {
        -- toggle showing URL, HTTP info, headers at top the of result window
        show_url = true,
        -- show the generated curl command in case you want to launch
        -- the same request via the terminal (can be verbose)
        show_curl_command = false,
        show_http_info = true,
        show_headers = true,
        -- executables or functions for formatting response body [optional]
        -- set them to false if you want to disable them
        formatters = {
          json = "jq",
          xml = "xq",
          html = "htmlq",
        },
      },
    })
  end,
}
