return {
  "nanotee/zoxide.vim",
  dependencies = {
    "junegunn/fzf",
  },
  keys = {
    {
      "<leader>za",
      function()
        local input = vim.fn.input("Z: ")
        print(input)
        vim.cmd("Z " .. input)
      end,
      desc = "zoxide all",
      silent = true,
    },
    {
      "<leader>zw",
      function()
        local input = vim.fn.input("Lz: ")
        vim.cmd("Lz " .. input .. "<cr>")
        print(input)
      end,
      desc = "zoxide window",
      silent = true,
    },
  },
}
