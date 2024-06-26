return {
  "https://gitlab.com/itaranto/plantuml.nvim",
  config = function()
    require("plantuml").setup(
      {
        renderer = {
          type = "text",
          options = {
            prog = "viu",
            split_cmd = "vsplit", -- Allowed values: `split`, `vsplit`.
          },
        },
        render_on_write = true, -- Set to false to disable auto-rendering.
      }
      -- {
      --   renderer = {
      --     type = "image",
      --     options = {
      --       prog = "feh",
      --       dark_mode = true,
      --     },
      --   },
      --   render_on_write = true,
      -- }
    )
  end,
}
