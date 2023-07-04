return {
  { "nvim-neotest/neotest-jest" },
  {
    "nvim-neotest/neotest",
    opts = function(_, opts)
      table.insert(
        opts.adapters,
        require("neotest-jest")({
          jestCommand = "yarn test --",
          env = { CI = true },
          cwd = function()
            return vim.fn.getcwd()
          end,
        })
      )
    end,
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    -- stylua: ignore
    keys = {
      { "<leader>tD", function() require("neotest").run.run({
        strategy = "dap",
        jestCommand = "yarn node --inspect $(yarn test) --",
      }) end, desc = "Debug Nearest" },
    },
  },
}
