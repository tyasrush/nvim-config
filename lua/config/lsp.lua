require("mason").setup {}
require("mason-lspconfig").setup {
  ensure_installed = {
    "lua_ls",
    "gopls",
    "pyright",
    "ts_ls",
    "astro",
    "eslint",
    "intelephense",
    "jdtls",
    "kotlin_language_server"
  },
  automatic_installation = true
}

local lsp = vim.lsp.config
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Enable LSP servers
vim.lsp.enable('ts_ls')
vim.lsp.enable('astro')
vim.lsp.enable('lua_ls')
vim.lsp.enable('gopls')
vim.lsp.enable('pyright')
vim.lsp.enable('eslint')
vim.lsp.enable('intelephense')
vim.lsp.enable('jdtls')
vim.lsp.enable('kotlin_language_server')

-- Configure TypeScript LSP
vim.lsp.config('ts_ls', {
  on_attach = function(client, bufnr)
    print("TypeScript LSP attached to buffer", bufnr)
  end,
  capabilities = capabilities,
  filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" }
})

-- Configure Astro LSP
vim.lsp.config('astro', {
  on_attach = function(client, bufnr)
    print("Astro LSP attached to buffer", bufnr)
  end,
  capabilities = capabilities,
  filetypes = { "astro" }
})

-- Configure Lua LSP
vim.lsp.config('lua_ls', {
  capabilities = capabilities
})

-- Configure Kotlin LSP
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
