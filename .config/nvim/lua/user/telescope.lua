local M = {}

M.dotfiles = function()
  require("telescope.builtin").find_files {
    prompt_title = "~ dotfiles ~",
    path_display = {
      "shorten",
    },
    cwd = "~/.config/nvim",
    hidden = true,
    no_ignore = true,
  }
end

M.org = function()
  require("telescope.builtin").find_files {
    prompt_title = "~ Org ~",
    path_display = {
      "shorten",
    },
    cwd = "~/code/org",
    hidden = true,
    no_ignore = true,
  }
end

return M
