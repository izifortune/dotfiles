return {
  {
    "mfussenegger/nvim-dap",
    opts = function()
      local dap = require("dap")
      dap.adapters.firefox = {
        type = "executable",
        command = "node",
        args = { os.getenv("HOME") .. "/.local/share/nvim/lazy/vscode-firefox-debug/dist/adapter.bundle.js" },
      }

      -- dap.adapters["pwa-node"] = {
      --   type = "executable",
      --   command = "node",
      --   args = { os.getenv "HOME" .. "/.local/share/nvim/lazy/vscode-js-debug/dist/src/build/generateDap.js" },
      -- }
      -- dap.adapters["pwa-node"] = {
      --           type = "server",
      --           host = "localhost",
      --           port = "${port}",
      --           executable = {
      --             command = "node",
      --             -- 💀 Make sure to update this path to point to your installation
      --             args = {
      --               require("mason-registry").get_package("js-debug-adapter"):get_install_path()
      --                 .. "/js-debug/src/dapDebugServer.js",
      --               "${port}",
      --             },
      --           },
      --         }
      --

      -- table.insert(dap.configurations.typescript, {
      --   name = "Jest Single",
      --   type = "node2",
      --   request = "launch",
      --   command = "yarn node --inspect $(yarn jest) -o",
      --   reAttach = true,
      --   trace = true,
      --   cwd = "${fileDirname}",
      --   console = "integratedTerminal",
      --   internalConsoleOptions = "neverOpen",
      --   rootPath = "${workspaceFolder}",
      --   args = {
      --     "--no-coverage",
      --     "--testLocationInResults",
      --     "--verbose",
      --     "--json",
      --     "--testNamePattern=${fileBasenameNoExtension}",
      --   },
      --   -- skipFiles = {
      --   --   "${workspaceRoot}/node_modules/**/*.js",
      --   --   "${workspaceRoot}/node_modules/**/*.ts",
      --   --   "${workspaceFolder}/node_modules/**/*.js",
      --   --   "${workspaceFolder}/node_modules/**/*.ts",
      --   --   "<node_internals>/**/*.js",
      --   -- },
      --   skipFiles = { "<node_internals>/**", "node_modules/**", "../../node_modules/**" },
      -- })

      table.insert(dap.configurations.typescript, {
        name = "Debug with Firefox",
        type = "firefox",
        request = "launch",
        reAttach = true,
        trace = true,
        firefoxExecutable = "/Applications/Firefox Developer Edition.app/Contents/MacOS/firefox",
        cwd = "${workspaceFolder}",
        url = "http://localhost:4200",
        webRoot = "${workspaceFolder}",
        port = 9222,
        sourceMaps = true,
      })

      table.insert(dap.configurations.typescript, {
        name = "Better Node Launch",
        type = "node2",
        request = "launch",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        console = "integratedTerminal",
        -- cwd = "${workspaceFolder}",
        -- -- skipFiles = {
        -- --   "${workspaceRoot}/node_modules/**/*.js",
        -- --   "${workspaceRoot}/node_modules/**/*.ts",
        -- --   "${workspaceFolder}/node_modules/**/*.js",
        -- --   "${workspaceFolder}/node_modules/**/*.ts",
        -- --   "<node_internals>/**/*.js",
        -- -- },
        skipFiles = { "<node_internals>/**", "node_modules/**", "../../node_modules/**" },
      })

      table.insert(dap.configurations.typescript, {
        name = "Jest Launch",
        type = "node2",
        request = "launch",
        program = function()
          local path = vim.fn.system("yarn bin jest")
          return path:sub(1, -5)
        end,
        args = {
          "${file}",
          "--runInBand",
          "--coverage=false",
        },
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        console = "integratedTerminal",
        -- cwd = "${workspaceFolder}",
        -- -- skipFiles = {
        -- --   "${workspaceRoot}/node_modules/**/*.js",
        -- --   "${workspaceRoot}/node_modules/**/*.ts",
        -- --   "${workspaceFolder}/node_modules/**/*.js",
        -- --   "${workspaceFolder}/node_modules/**/*.ts",
        -- --   "<node_internals>/**/*.js",
        -- -- },
        skipFiles = { "<node_internals>/**", "node_modules/**", "../../node_modules/**" },
      })

      table.insert(dap.configurations.javascript, {
        name = "Better Node Launch",
        type = "node2",
        request = "launch",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        console = "integratedTerminal",
        -- cwd = "${workspaceFolder}",
        -- -- skipFiles = {
        -- --   "${workspaceRoot}/node_modules/**/*.js",
        -- --   "${workspaceRoot}/node_modules/**/*.ts",
        -- --   "${workspaceFolder}/node_modules/**/*.js",
        -- --   "${workspaceFolder}/node_modules/**/*.ts",
        -- --   "<node_internals>/**/*.js",
        -- -- },
        skipFiles = { "<node_internals>/**", "node_modules/**", "../../node_modules/**" },
      })

      table.insert(dap.configurations.typescript, {
        name = "Better Node Attach",
        type = "node2",
        request = "attach",
        processId = "${command:pickProcess}",
        reAttach = true,
        trace = true,
        cwd = "${workspaceFolder}",
        -- skipFiles = {
        --   "${workspaceRoot}/node_modules/**/*.js",
        --   "${workspaceRoot}/node_modules/**/*.ts",
        --   "${workspaceFolder}/node_modules/**/*.js",
        --   "${workspaceFolder}/node_modules/**/*.ts",
        --   "<node_internals>/**/*.js",
        -- },
        skipFiles = { "<node_internals>/**", "node_modules/**", "../../node_modules/**" },
      })
    end,
  },
}
