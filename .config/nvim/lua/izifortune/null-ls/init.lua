local M = {}

local nullls = require("null-ls")

local prettierd_filetypes = { unpack(nullls.builtins.formatting.prettierd.filetypes) }
table.insert(prettierd_filetypes, "graphql")
table.insert(prettierd_filetypes, "jsonc")

M.sources = {
  nullls.builtins.formatting.stylua,
  nullls.builtins.formatting.prettierd.with({
    filetypes = prettierd_filetypes,
  }),
  nullls.builtins.formatting.trim_whitespace.with({
    filetypes = { "plantuml" },
  }),
  nullls.builtins.formatting.autopep8,
  nullls.builtins.formatting.shellcheck,
  nullls.builtins.formatting.shfmt,
  nullls.builtins.formatting.json_tool,
  nullls.builtins.diagnostics.write_good,
  nullls.builtins.code_actions.gitsigns,
  nullls.builtins.formatting.sqlformat,
  nullls.builtins.formatting.markdownlint,
  nullls.builtins.formatting.lua_format,
  nullls.builtins.formatting.stylelint,
  nullls.builtins.diagnostics.write_good.with({
    filetypes = { "markdown", "txt" }
  }),
  -- nullls.builtins.diagnostics.proselint,
  -- nullls.builtins.code_actions.proselint,
  nullls.builtins.diagnostics.misspell,
  -- curl -L -o ./install-misspell.sh https://git.io/misspell && sh ./install-misspell.sh -b /usr/local/bin

  -- nullls.builtins.diagnostics.yamllint
  -- pip install --user yamllint
}

function M.on_attach(client)
  -- Format on save
  if client.resolved_capabilities.document_formatting then
    -- vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  end
end

function M.config()
  require("null-ls").config({
    sources = M.sources,
    debug = true,
  })
  require("lspconfig")["null-ls"].setup({
    on_attach = M.on_attach,
  })
end

return M
