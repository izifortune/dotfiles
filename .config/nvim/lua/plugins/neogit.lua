return {
  "NeogitOrg/neogit",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    local neogit = require("neogit")

    neogit.setup({
      disable_commit_confirmation = true,
    })
  end,
}
