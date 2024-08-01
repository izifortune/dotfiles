-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set({ "i" }, "jj", "<esc>")
vim.keymap.set({ "n" }, "<tab>", "<cmd>BufferLineCycleNext<cr>")
vim.keymap.set({ "n" }, "<S-tab>", "<cmd>BufferLineCyclePrev<cr>")
vim.keymap.set({ "n" }, "<C-o>", "<cmd>close<cr>")
vim.keymap.set({ "n" }, "<leader>fd", ":cd %:p:h<cr>", { desc = "CD to current dir of file" })
vim.keymap.set(
  { "n" },
  "<leader>hr",
  ':lua name = vim.fn.input("plugin"); require("lazy.core.loader").reload(name)<cr>',
  { desc = "Plugin reload" }
)
vim.keymap.del("n", "<C-o>", { desc = "Reenable jumps" })

-- local nvim_tmux_nav = require("nvim-tmux-navigation")
--
-- vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
-- vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
-- vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
-- vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
-- vim.keymap.set("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
-- vim.keymap.set("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
local tmux = require("tmux")
vim.keymap.set("n", "<C-h>", tmux.move_left)
vim.keymap.set("n", "<C-j>", tmux.move_bottom)
vim.keymap.set("n", "<C-k>", tmux.move_top)
vim.keymap.set("n", "<C-l>", tmux.move_right)

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', opts)
-- save file
vim.keymap.del({ "i", "x", "n", "s" }, "<C-s>")

vim.keymap.set("n", "<C-s>", require("auto-session.session-lens").search_session, {
  noremap = true,
})

local function execute(opts)
  local params = {
    command = opts.command,
    arguments = opts.arguments,
  }
  if opts.open then
    require("trouble").open({
      mode = "lsp_command",
      params = params,
    })
  else
    return vim.lsp.buf_request(0, "workspace/executeCommand", params, opts.handler)
  end
end

vim.keymap.set("n", "<leader>cp", function()
  for _, client in ipairs(vim.lsp.get_clients({ name = "vtsls" })) do
    print(vim.inspect(client.config.settings))
    local settings = {
      vtsls = {
        init_options = { hostInfo = "neovim" },
        autoUseWorkspaceTsdk = false,
        typescript = {
          tsdk = ".yarn/sdks/typescript/lib",
        },
      },
    }
    client.config.settings = vim.tbl_deep_extend("force", client.config.settings, settings)
    print(vim.inspect(settings))
    client.notify("workspace/didChangeConfiguration", { settings = settings })
  end
  -- execute({ command = "typescript.selectTypeScriptVersion" })
end)
