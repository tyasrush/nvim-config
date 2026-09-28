return {
  "mistweaverco/kulala.nvim",
  ft = "http", -- Only load the plugin when you open an .http file (lazy loading)
  config = function()
    local kulala = require("kulala")

    -- Basic setup options
    kulala.setup({
      -- Displays successful response bodies using native tree-sitter or jq formatting
      display_mode = "split", -- Options: "split", "float"
      default_view = "body",  -- Show the JSON body first (instead of headers)
      icons = {
        inbound = "▼",
        outbound = "▲",
      },
    })

    -- Ergonomic Keymaps for API testing
    -- These keys only activate when inside an .http file
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "http",
      callback = function()
        -- <leader>r : Run the request under your current cursor position
        vim.keymap.set("n", "<leader>r", kulala.run, { buffer = true, desc = "Run current HTTP request" })

        -- <leader>R : Run ALL requests sequentially in the current file
        vim.keymap.set("n", "<leader>R", kulala.run_all, { buffer = true, desc = "Run all HTTP requests" })

        -- [r and ]r : Easily jump between distinct request blocks in the file
        vim.keymap.set("n", "[r", kulala.jump_prev, { buffer = true, desc = "Jump to previous request" })
        vim.keymap.set("n", "]r", kulala.jump_next, { buffer = true, desc = "Jump to next request" })

        -- <leader>co : Copy the current request out as a raw, executable shell curl command
        vim.keymap.set("n", "<leader>co", kulala.copy, { buffer = true, desc = "Copy request as curl command" })
      end,
    })
  end,
}
