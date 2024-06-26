return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "canary",
  dependencies = {
    { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
  },
  keys = {
    { "<leader>ac", mode = "n", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat" },
    { "<leader>at", mode = "n", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat" },
  },
  opts = {
    -- debug = true, -- Enable debugging
    -- See Configuration section for rest
  },
  -- See Commands section for default commands if you want to lazy load on them
}
