-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.conceallevel = 0
vim.lsp.set_log_level("off")
vim.opt.clipboard = "" -- DO NOT Sync with system clipboard
vim.fn.setenv("MACOSX_DEPLOYMENT_TARGET", "10.15") -- luarocks macos

vim.api.nvim_create_user_command("LambdaVersion", function()
  local ok, Job = pcall(require, "plenary.job")
  Job:new({
    command = "aws",
    args = {
      "lambda",
      "list-version-by-function",
      "--function-name FR-SIT-SHIELD-GETOPTIONS-LE",
      "--region us-east-1",
      "--query 'Versions[-1]'",
      "--output json",
    },
    -- utils.authorization_header(),
    -- utils.api_url(),
    on_stdout = function(res)
      print(vim.inspect(res))
    end,
    on_sterr = function(res)
      print(vim.inspect(res))
    end,
    on_exit = function(job, return_val)
      local result = job:result()
      print(vim.inspect(result))
      local ok, parsed = pcall(vim.json.decode, table.concat(result, ""))
      if not ok then
        -- vim.notify("Failed to parse result")
        return
      end

      local items = {}
      print(vim.inspect(parsed))
      -- for _, jira_issue in ipairs(parsed["issues"]) do
      --   table.insert(items, {
      --     label = string.format("# %s %s", jira_issue.key, jira_issue["fields"]["summary"]),
      --     insertText = jira_issue.key, -- the text to insert when completed
      --   })
      -- end

      -- callback({ items = items, isIncomplete = false })
      -- self.cache[bufnr] = items
    end,
  }):start()
end, {})

vim.api.nvim_create_user_command("Count", ":s%/<args>//gn", { nargs = 1 })
vim.api.nvim_create_user_command("CountLine", ":s/<args>//gn", { nargs = 1 })
