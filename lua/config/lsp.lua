require("mason").setup {}
require("mason-lspconfig").setup {
  automatic_enable = {
    "lua_ls",
    "gopls",
    "pyright",
    "eslint",
    "intelephense",
    "jdtls",
    "kotlin_language_server"
  }
}

local lsp = vim.lsp.config
local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config('lua_ls', {
  capabilities = capabilities
})

vim.lsp.config('ts_ls', {
  capabilities = capabilities
})

vim.lsp.config('kotlin_language_server', {
  capabilities = capabilities,
  settings = {
    kotlin = {
      compiler = {
        jvm = {
          target = "21"
        }
      }
    }
  }
})
