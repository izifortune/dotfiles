return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = true,
  keys = {
    {
      "<leader>ft",
      "<cmd>:ToggleTerm size=20 direction=horizontal<cr>",
      desc = "Toggle terminal",
    },
    {
      "<leader>fT",
      "<cmd>:ToggleTerm direction=float<cr>",
      desc = "Toggle float terminal",
    },
    {
      "<leader>fJ",
      '<cmd>:TermExec cmd="jira issue create" direction=float<cr>',
      desc = "Toggle jira create",
    },
  },
}
