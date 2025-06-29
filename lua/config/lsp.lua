require("mason").setup {}
require("mason-lspconfig").setup {
  automatic_enable = {
    "lua_ls",
    "gopls",
    "pyright",
    "eslint",
    "intelephense"
  }
}

local lsp = require('lspconfig')
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lsp.lua_ls.setup {
  capabilities = capabilities
}

lsp.ts_ls.setup {
  capabilities = capabilities
}
