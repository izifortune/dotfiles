return {
  "aserowy/tmux.nvim",
  lazy = false,
  config = function()
    local tmux = require("tmux")
    return tmux.setup({
      sync_clipboard = false,
    })
  end,
  -- keys = {
  --   ["<C-h>"] = { '<cmd>lua require("tmux").move_left()<cr>' },
  --   ["<C-j>"] = { '<cmd>lua require("tmux").move_bottom()<cr>' },
  --   ["<C-k>"] = { '<cmd>lua require("tmux").move_top()<cr>' },
  --   ["<C-l>"] = { '<cmd>lua require("tmux").move_right()<cr>' },
  -- },
  -- "alexghergh/nvim-tmux-navigation",
  -- lazy = false,
  -- config = function()
  --   require("nvim-tmux-navigation").setup({
  --     disable_when_zoomed = true, -- defaults to false
  --     keybindings = {
  --       left = "<C-h>",
  --       down = "<C-j>",
  --       up = "<C-k>",
  --       right = "<C-l>",
  --       last_active = "<C-\\>",
  --       next = "<C-Space>",
  --     },
  --   })
  -- end,
}
