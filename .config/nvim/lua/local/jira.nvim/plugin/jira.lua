vim.api.nvim_create_user_command("JiraCreateTicket", function()
  require("jira").createTicket()
end, {})

vim.api.nvim_create_user_command("JiraGetTicketsList", function()
  require("jira").getTicketsList()
end, {})

vim.api.nvim_create_user_command("JiraGetReportedTicketList", function()
  require("jira").getReportedTicketList()
end, {})
