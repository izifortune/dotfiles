local nvim_lsp = require('lspconfig')

vim.api.nvim_command([[
  autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
  autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)
  autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 100)
  autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
  autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
  autocmd BufWritePre *.html lua vim.lsp.buf.formatting_sync(nil, 100)
]])

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- vim.api.nvim_command("au BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)")

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<leader>K', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<leader>lo', '<cmd> lua vim.lsp.buf.execute_command({command = "_typescript.organizeImports", arguments = {vim.fn.expand("%:p")}})<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<leader><leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<leader><leader>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      " augroup lsp_document_highlight
      "   autocmd! * <buffer>
      "   autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      "   autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      " augroup END
    ]], false)
  end
end

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = {vim.api.nvim_buf_get_name(0)},
    title = ""
  }
  vim.lsp.buf.execute_command(params)
end

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports"
    }
  }
}

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = { "pyright", "angularls", "vimls", "jsonls", "bashls", "yamlls", "cssls", "html", "graphql", "stylelint_lsp", "eslint" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach
  }
end

-- nvim_lsp.tsserver.setup {
--     on_attach = on_attach,
--     root_dir = function(fname)
--       return nvim_lsp.util.root_pattern("tsconfig.lint.json")(fname) or
--       nvim_lsp.util.root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git")(fname);
--     end
-- }
--
-- nvim_lsp.tsserver.setup {
--   on_attach = on_attach,
--   cmd = { "typescript-language-server", "--stdio" },
--   filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
--   root_dir = nvim_lsp.util.root_pattern("package.json", "tsconfig.lint.json",  "tsconfig.json", "jsconfig.json", ".git")
-- }

nvim_lsp.yamlls.setup {
  settings = {
    yaml = {
      customTags = {
        -- AWS CFN template
        "!Equals scalar",
        "!GetAtt scalar",
        "!Join scalar",
        "!Or scalar",
        "!Ref scalar",
        "!Sub scalar",
        "!Not scalar"
      },
      format = {
        enable = true,
        proseWrape = "always",
        prrintWith = 120,
      },
    }
  }
}

local cmd = {"node", "~/.nvm/versions/node/v12.19.0/lib/node_modules/@angular/language-server/index.js", "--stdio", "--tsProbeLocations", "" , "--ngProbeLocations", ""}

nvim_lsp.angularls.setup{
  cmd = cmd,
  on_new_config = function(new_config,new_root_dir)
    new_config.cmd = cmd
  end,
}
