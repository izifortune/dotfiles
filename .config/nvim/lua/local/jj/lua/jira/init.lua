local nio = require("nio")

local M = {}

function M.setup()
  vim.api.nvim_create_user_command("JiraCreate", function()
    local task = nio.run(function()
      local process, err = nio.process.run({
        cmd = "jira",
        args = { "issue list -a$(jira me) -s~Closed -s~Live -s~Rejected -s~Done -pTP" },
      })

      local output = process.stdout.read()
      print(output)
      return output
    end)
  end, {})
end

return M
