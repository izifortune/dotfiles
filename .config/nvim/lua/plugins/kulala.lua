return {
  "mistweaverco/kulala.nvim",
  ft = "http",
  keys = {
    { "<leader>R", "", desc = "+Rest" },
    { "<leader>Rr", "<cmd>lua require('kulala').run()<cr>", desc = "Send the request" },
    { "<leader>Rs", "<cmd>lua require('kulala').set_selected_env()<cr>", desc = "Select env" },
    { "<leader>Rt", "<cmd>lua require('kulala').toggle_view()<cr>", desc = "Toggle headers/body" },
    { "<leader>Rp", "<cmd>lua require('kulala').jump_prev()<cr>", desc = "Jump to previous request" },
    { "<leader>Rn", "<cmd>lua require('kulala').jump_next()<cr>", desc = "Jump to next request" },
  },
  opts = {
    -- default_view, body or headers or headers_body
    default_view = "headers_body",
    default_env = "sit",
  },
}
