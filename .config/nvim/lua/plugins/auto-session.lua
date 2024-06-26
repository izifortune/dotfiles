return {
  "rmagatti/auto-session",
  lazy = false,
  config = function()
    -- save file
    vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
    require("auto-session").setup({
      log_level = "error",
      auto_session_allowed_dirs = { "~/code" },
    })
    -- keys are defined in keymaps.lua
  end,
}
