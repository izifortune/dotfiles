vim.api.nvim_create_user_command("JiraCreateTicket", function()
  require("jira").createTicket()
end, {})

vim.api.nvim_create_user_command("JiraGetTicketsList", function()
  require("jira").getTicketsList()
end, {})
