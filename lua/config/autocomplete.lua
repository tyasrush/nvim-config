local cmp = require("cmp")
cmp.setup {
  sources = cmp.config.sources({
    { name = 'nvim_lsp_signature_help' },
    { name = "nvim_lsp" },
    { name = "path" },
    { name = 'orgmode' },
  }, {
    { name = "buffer" }
  }),
  snippet = {
    expand = function(args)
      -- Comes from vsnip
      vim.snippet.expand(args.body)
    end,
  }
}

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    local clients = vim.lsp.get_clients()
    if client == nil then
      return
    end
    if clients[1].server_capabilities.documentHighlightProvider then
      vim.lsp.buf.document_highlight()
    end
  end,
})

vim.api.nvim_create_autocmd("CursorHoldI", {
  callback = function()
    local clients = vim.lsp.get_active_clients()
    if client == nil then
      return
    end
    if clients[1].server_capabilities.documentHighlightProvider then
      vim.lsp.buf.document_highlight()
    end
  end,
})

vim.api.nvim_create_autocmd("CursorMoved", {
  callback = function()
    vim.lsp.buf.clear_references()
  end,
})

local builtin = require('telescope.builtin')
local map = vim.keymap.set

map("n", "gd", function() builtin.lsp_definitions({ reuse_win = true }) end)
map("n", "gi", function() builtin.lsp_implementations({ reuse_win = true }) end)
map("n", "gr", builtin.lsp_references)
map("n", "gds", builtin.lsp_document_symbols)
map("n", "gws", builtin.lsp_workspace_symbols)

map("n", "K", function()
  vim.lsp.buf.hover()
end)

map("n", "<leader>cl", function()
  vim.lsp.codelens.run()
end)

map("n", "<leader>sh", function()
  vim.lsp.buf.signature_help()
end)

map("n", "<leader>rn", function()
  vim.lsp.buf.rename()
end)

-- map("n", "<leader>f", function()
--   vim.lsp.buf.formatting()
-- end)
