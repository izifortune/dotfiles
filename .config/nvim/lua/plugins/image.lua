return {
  enabled = false,
  "3rd/image.nvim",
  -- Disable on Windows system
  cond = function()
    return vim.fn.has("win32") ~= 1
  end,
  dependencies = {
    "leafo/magick",
  },
  opts = {
    -- image.nvim config
  },
}
