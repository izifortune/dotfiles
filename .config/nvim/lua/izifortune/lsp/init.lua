local nvim_lsp = require('lspconfig')

-- local custom_attach = function(client)
--   print("'" .. client.name .. "' language server started" );
--
--   require'completion'.on_attach(client)
--   require'diagnostic'.on_attach(client)
--
--   -- key bindings ommitted
-- end
--
-- nvim_lsp.diagnosticls.setup{
--   on_attach=custom_attach,
--   filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'css', 'scss', 'markdown', 'pandoc' },
--   init_options = {
--     linters = {
--       tslint = {
--         command = 'tslint',
--         rootPatterns = { '.git' },
--         debounce = 100,
--         args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
--         sourceName = 'tslint',
--         parseJson = {
--           errorsRoot = '[0].messages',
--           line = 'line',
--           column = 'column',
--           endLine = 'endLine',
--           endColumn = 'endColumn',
--           message = '[eslint] ${message} [${ruleId}]',
--           security = 'severity'
--         },
--         securities = {
--           [2] = 'error',
--           [1] = 'warning'
--         }
--       },
--       eslint = {
--         command = 'eslint',
--         rootPatterns = { '.git' },
--         debounce = 100,
--         args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
--         sourceName = 'eslint',
--         parseJson = {
--           errorsRoot = '[0].messages',
--           line = 'line',
--           column = 'column',
--           endLine = 'endLine',
--           endColumn = 'endColumn',
--           message = '[eslint] ${message} [${ruleId}]',
--           security = 'severity'
--         },
--         securities = {
--           [2] = 'error',
--           [1] = 'warning'
--         }
--       },
--       markdownlint = {
--         command = 'markdownlint',
--         rootPatterns = { '.git' },
--         isStderr = true,
--         debounce = 100,
--         args = { '--stdin' },
--         offsetLine = 0,
--         offsetColumn = 0,
--         sourceName = 'markdownlint',
--         securities = {
--           undefined = 'hint'
--         },
--         formatLines = 1,
--         formatPattern = {
--           '^.*:(\\d+)\\s+(.*)$',
--           {
--             line = 1,
--             column = -1,
--             message = 2,
--           }
--         }
--       }
--     },
--     filetypes = {
--       javascript = 'eslint',
--       javascriptreact = 'eslint',
--       typescript = 'tslint',
--       typescriptreact = 'tslint',
--       markdown = 'markdownlint',
--       pandoc = 'markdownlint'
--     },
--     formatters = {
--       prettierEslint = {
--         command = 'prettier-eslint',
--         args = { '--stdin' },
--         rootPatterns = { '.git' },
--       },
--       prettier = {
--         command = 'prettier',
--         args = { '--stdin-filepath', '%filename' }
--       }
--     },
--     formatFiletypes = {
--       css = 'prettier',
--       javascript = 'prettierEslint',
--       javascriptreact = 'prettierEslint',
--       json = 'prettier',
--       scss = 'prettier',
--       typescript = 'prettierEslint',
--       typescriptreact = 'prettierEslint'
--     }
--   }
-- }
--

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

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
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

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = { "pyright", "tsserver", "angularls", "vimls", "jsonls", "bashls", "yamlls" }
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
