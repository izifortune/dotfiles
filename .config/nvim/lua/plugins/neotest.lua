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
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- this adding nvim-treesitter,
      "haydenmeade/neotest-jest",
    },
    "nvim-neotest/neotest",
    opts = function(_, opts)
      table.insert(
        opts.adapters,
        require("neotest-jest")({
          jestCommand = "yarn jest",
          env = { CI = true },
          jestConfigFile = "jest.config.ts",
          cwd = function()
            return vim.fn.getcwd()
          end,
          -- cwd = function()
          --   local file = vim.fn.expand("%:p")
          --   if string.find(file, "/packages/") then
          --     return string.match(file, "(.-/[^/]+/)src")
          --   end
          --   if string.find(file, "/libs/") then
          --     return string.match(file, "(.-/[^/]+/)src")
          --   end
          --   return vim.fn.getcwd()
          -- end,
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
