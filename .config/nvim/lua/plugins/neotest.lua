return {
  {
    "nvim-neotest/neotest-jest",
    keys = {
      {
        "<leader>tw",
        "<cmd>lua require('neotest').run.run({ jestCommand = 'yarn jest --watch ' })<cr>",
        desc = "Run tests watch mode",
      },
    },
  },
  {
    "nvim-neotest/neotest",
    opts = function(_, opts)
      table.insert(
        opts.adapters,
        require("neotest-jest")({
          jestCommand = "yarn jest",
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
        jestCommand = "node --inspect $(yarn bin jest) --runInBand",
      }) end, desc = "Debug Nearest" },
    },
  },
}
