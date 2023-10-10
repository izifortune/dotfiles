return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mxsdev/nvim-dap-vscode-js",
      {
        "microsoft/vscode-js-debug",
        version = "1.x",
        build = "npm ci --ignore-optionals --legacy-peer-dep && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
      },
    },
    opts = function()
      local dap = require("dap")
      require("dap-vscode-js").setup({
        debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
        adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
      })
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
        skipFiles = { "<node_internals>/**", "node_modules/**", "../../node_modules/**" },
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

      table.insert(dap.configurations.typescript, {
        -- use nvim-dap-vscode-js's pwa-node debug adapter
        type = "pwa-node",
        -- launch a new process to attach the debugger to
        request = "launch",
        -- name of the debug action you have to select for this config
        name = "PWA Node launch",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        skipFiles = { "<node_internals>/**", "node_modules/**", "../../node_modules/**" },
      })

      table.insert(dap.configurations.typescript, {
        type = "pwa-node",
        request = "launch",
        name = "Launch Current File (pwa-node with ts-node)",
        cwd = vim.fn.getcwd(),
        runtimeArgs = { "--loader", "ts-node/esm" },
        runtimeExecutable = "node",
        args = { "${file}" },
        sourceMaps = true,
        protocol = "inspector",
        skipFiles = { "<node_internals>/**", "node_modules/**" },
        resolveSourceMapLocations = {
          "${workspaceFolder}/**",
          "!**/node_modules/**",
        },
      })
      -- {
      --   type = 'pwa-node',
      --   request = 'launch',
      --   name = 'Launch Current File (pwa-node)',
      --   cwd = vim.fn.getcwd(),
      --   args = { '${file}' },
      --   sourceMaps = true,
      --   protocol = 'inspector',
      -- },
      -- {
      --   type = 'pwa-node',
      --   request = 'launch',
      --   name = 'Launch Current File (pwa-node with ts-node)',
      --   cwd = vim.fn.getcwd(),
      --   runtimeArgs = { '--loader', 'ts-node/esm' },
      --   runtimeExecutable = 'node',
      --   args = { '${file}' },
      --   sourceMaps = true,
      --   protocol = 'inspector',
      --   skipFiles = { '<node_internals>/**', 'node_modules/**' },
      --   resolveSourceMapLocations = {
      --     "${workspaceFolder}/**",
      --     "!**/node_modules/**",
      --   },
      -- },
      -- {
      --   type = 'pwa-node',
      --   request = 'launch',
      --   name = 'Launch Current File (pwa-node with deno)',
      --   cwd = vim.fn.getcwd(),
      --   runtimeArgs = { 'run', '--inspect-brk', '--allow-all', '${file}' },
      --   runtimeExecutable = 'deno',
      --   attachSimplePort = 9229,
      -- },
      -- {
      --   type = 'pwa-node',
      --   request = 'launch',
      --   name = 'Launch Test Current File (pwa-node with jest)',
      --   cwd = vim.fn.getcwd(),
      --   runtimeArgs = { '${workspaceFolder}/node_modules/.bin/jest' },
      --   runtimeExecutable = 'node',
      --   args = { '${file}', '--coverage', 'false'},
      --   rootPath = '${workspaceFolder}',
      --   sourceMaps = true,
      --   console = 'integratedTerminal',
      --   internalConsoleOptions = 'neverOpen',
      --   skipFiles = { '<node_internals>/**', 'node_modules/**' },
      -- },
      -- {
      --   type = 'pwa-node',
      --   request = 'launch',
      --   name = 'Launch Test Current File (pwa-node with vitest)',
      --   cwd = vim.fn.getcwd(),
      --   program = '${workspaceFolder}/node_modules/vitest/vitest.mjs',
      --   args = { '--inspect-brk', '--threads', 'false', 'run', '${file}' },
      --   autoAttachChildProcesses = true,
      --   smartStep = true,
      --   console = 'integratedTerminal',
      --   skipFiles = { '<node_internals>/**', 'node_modules/**' },
      -- },
      -- {
      --   type = 'pwa-node',
      --   request = 'launch',
      --   name = 'Launch Test Current File (pwa-node with deno)',
      --   cwd = vim.fn.getcwd(),
      --   runtimeArgs = { 'test', '--inspect-brk', '--allow-all', '${file}' },
      --   runtimeExecutable = 'deno',
      --   attachSimplePort = 9229,
      -- },
      -- {
      --   type = 'pwa-chrome',
      --   request = 'attach',
      --   name = 'Attach Program (pwa-chrome = { port: 9222 })',
      --   program = '${file}',
      --   cwd = vim.fn.getcwd(),
      --   sourceMaps = true,
      --   port = 9222,
      --   webRoot = '${workspaceFolder}',
      -- },
      -- {
      --   type = 'node2',
      --   request = 'attach',
      --   name = 'Attach Program (Node2)',
      --   processId = require('dap.utils').pick_process,
      -- },
      -- {
      --   type = 'node2',
      --   request = 'attach',
      --   name = 'Attach Program (Node2 with ts-node)',
      --   cwd = vim.fn.getcwd(),
      --   sourceMaps = true,
      --   skipFiles = { '<node_internals>/**' },
      --   port = 9229,
      -- },
      -- {
      --   type = 'pwa-node',
      --   request = 'attach',
      --   name = 'Attach Program (pwa-node)',
      --   cwd = vim.fn.getcwd(),
      --   processId = require('dap.utils').pick_process,
      --   skipFiles = { '<node_internals>/**' },
      -- },
    end,
  },
}
