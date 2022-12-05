local servers = {
  "cssls",
  -- "emmet_ls",
  "html",
  "jdtls",
  "jsonls",
  "solc",
  "sumneko_lua",
  "tflint",
  "terraformls",
  "tsserver",
  "pyright",
  "stylelint_lsp",
  "eslint",
  "yamlls",
  "bashls",
  "clangd",
  "taplo",
  "zk@v0.10.1",
  -- "ltex",
  "angularls",
  "cucumber_language_server"
}

local settings = {
  ui = {
    border = "rounded",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup {
  ensure_installed = servers,
  automatic_installation = true,
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("izifortune.lsp.handlers").on_attach,
    capabilities = require("izifortune.lsp.handlers").capabilities,
  }

  server = vim.split(server, "@")[1]

  if server == "jsonls" then
    local jsonls_opts = require "izifortune.lsp.settings.jsonls"
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if server == "stylelint_lsp" then
    local stylelint_lsp_opts = require "izifortune.lsp.settings.stylelint_lsp"
    opts = vim.tbl_deep_extend("force", stylelint_lsp_opts, opts)
  end

  if server == "yamlls" then
    local yamlls_opts = require "izifortune.lsp.settings.yamlls"
    local cfg = require("yaml-companion").setup({
      -- Add any options here, or leave empty to use the default settings
      -- lspconfig = {
      --   cmd = {"yaml-language-server"}
      -- },
    })
    opts = vim.tbl_deep_extend("force", cfg, opts)
  end

  if server == "sumneko_lua" then
    local sumneko_opts = require "izifortune.lsp.settings.sumneko_lua"
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if server == "tsserver" then
    local tsserver_opts = require "izifortune.lsp.settings.tsserver"
    opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
  end

  if server == "pyright" then
    local pyright_opts = require "izifortune.lsp.settings.pyright"
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  if server == "solc" then
    local solc_opts = require "izifortune.lsp.settings.solc"
    opts = vim.tbl_deep_extend("force", solc_opts, opts)
  end

  if server == "emmet_ls" then
    local emmet_ls_opts = require "izifortune.lsp.settings.emmet_ls"
    opts = vim.tbl_deep_extend("force", emmet_ls_opts, opts)
  end

  if server == "zk" then
    local zk_opts = require "izifortune.lsp.settings.zk"
    opts = vim.tbl_deep_extend("force", zk_opts, opts)
  end

  if server == "cucumber_language_server" then
    -- local cucumber = require "izifortune.lsp.settings.cucumber"
    -- opts = vim.tbl_deep_extend("force", cucumber, opts)
  end

  if server == "jdtls" then
    goto continue
  end

  lspconfig[server].setup(opts)
  ::continue::
end

-- TODO: add something to installer later
-- require("lspconfig").motoko.setup {}
