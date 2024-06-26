return {
  "linrongbin16/gitlinker.nvim",
  keys = {
    { "<leader>gy", "<cmd>GitLink ryanair_default<cr>", mode = { "n", "v" }, desc = "Yank default branch link" },
    { "<leader>gY", "<cmd>GitLink ryanair_current<cr>", mode = { "n", "v" }, desc = "Yank current branch link" },
  },
  cmd = "GitLink",
  config = function()
    require("gitlinker").setup({
      router = {
        ryanair_default = {
          ["altssh.bitbucket.org"] = "https://bitbucket.org/"
            .. "{_A.ORG}/"
            .. "{_A.REPO}/src/"
            .. "{_A.DEFAULT_BRANCH}/"
            .. "{_A.FILE}"
            .. "#lines-{_A.LSTART}"
            .. "{(_A.LEND > _A.LSTART and (':' .. _A.LEND) or '')}",
        },
        ryanair_current = {
          ["altssh.bitbucket.org"] = "https://bitbucket.org/"
            .. "{_A.ORG}/"
            .. "{_A.REPO}/src/"
            .. "{_A.CURRENT_BRANCH}/"
            .. "{_A.FILE}"
            .. "#lines-{_A.LSTART}"
            .. "{(_A.LEND > _A.LSTART and (':' .. _A.LEND) or '')}",
        },
      },
    })
  end,
}
