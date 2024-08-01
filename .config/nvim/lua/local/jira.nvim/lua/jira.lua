-- main module file
local module = require("jira.module")

---@class Config
---@field opt string Your config option
local config = {
  opt = "Hello!",
}

---@class MyModule
local M = {}

---@type Config
M.config = config

---@param args Config?
-- you can define your setup function here. Usually configurations can be merged, accepting outside params and
-- you can also put some validation here for those.
M.setup = function(args)
  M.config = vim.tbl_deep_extend("force", M.config, args or {})
end

M.createTicket = function()
  return module.createTicket(M.config.opt)
end

M.getTicketsList = function()
  return module.getTicketsList()
end

M.getReportedTicketList = function()
  return module.getReportedTicketList()
end

return M
