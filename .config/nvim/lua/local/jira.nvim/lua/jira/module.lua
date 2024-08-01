local nio = require("nio")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

---@class CustomModule
local M = {}

local function split(str, sep)
  local fields = {}
  local pattern = string.format("([^%s]+)", sep)
  str:gsub(pattern, function(c)
    print(c)
    fields[#fields + 1] = c
  end)
  return fields
end

local parseResults = function(list)
  print(vim.inspect(list))
  local results = split(list, "\n")
  table.remove(results, 1)
  local parsedResults = {}
  for i, v in ipairs(results) do
    parsedResults[i] = split(v, "\t")
  end
  return parsedResults
end

local createPicker = function(list)
  local results = parseResults(list)
  print(vim.inspect(results))
  opts = opts or {}
  vim.schedule(function()
    pickers
      .new(opts, {
        prompt_title = "colors",
        finder = finders.new_table({
          results = results,
          entry_maker = function(entry)
            print(vim.inspect(entry))
            return {
              value = entry[2],
              display = entry[3] .. " [" .. entry[4] .. "]",
              ordinal = entry[2],
            }
          end,
        }),
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, map)
          actions.select_default:replace(function()
            actions.close(prompt_bufnr)
            local selection = action_state.get_selected_entry()
            print(vim.inspect(selection))
            -- print(vim.inspect(selection))
            -- vim.api.nvim_put({ selection[1] }, "", false, true)
          end)
          return true
        end,
      })
      :find()
  end)
end

M.getTicketsList = function()
  return nio.run(function()
    local process, err = nio.process.run({
      cmd = "/opt/homebrew/bin/jira",
      args = {
        "issue",
        "list",
        "-q project in (Trip\\ Planner) and assignee = 70121:55b4d03b-c17d-48e0-b6ec-b9003a5e6d50 and status not in (Closed, Rejected, Done, Live)",
        "--plain",
        "--no-headers",
      },
    })

    local output = process.stdout.read()
    local errout = process.stderr.read()
    print(output)
    createPicker(output)
  end)
end

M.getReportedTicketList = function()
  return nio.run(function()
    local process, err = nio.process.run({
      cmd = "/opt/homebrew/bin/jira",
      args = {
        "issue",
        "list",
        "-q reporter = 70121:55b4d03b-c17d-48e0-b6ec-b9003a5e6d50 and status not in (Closed, Rejected, Done, Live)",
        "--plain",
        "--no-headers",
      },
    })

    local output = process.stdout.read()
    local errout = process.stderr.read()
    print(output)
    createPicker(output)
  end)
end

---@return string
M.createTicket = function(args)
  return nio.run(function()
    local summary = nio.ui.input({ prompt = "Enter summary: " })
    local process, err = nio.process.run({
      -- cmd = "jira",
      -- args = { "issue", "list", "-a$(jira me)", "-s~Closed", "-s~Live", "-s~Rejected", "-s~Done", "-pTP" },
      -- jira issue create -tBug -s"New Bug" -yHigh -lbug -lurgent -b"Bug description" --fix-version v2.0 --no-input
      cmd = "/usr/local/bin/jira",
      args = { "issue", "create", "-tTask", "-s" .. summary, "--no-input" },
    })
    local output = process.stdout.read()
    print(output)
  end)
end

return M
