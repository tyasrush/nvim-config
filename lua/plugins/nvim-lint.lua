return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")

      -- Configure linters for each filetype
      lint.linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        go = { "golangcilint" },
      }

      -- Create autocommand to run linters
      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          -- Only lint if we have linters configured for this filetype
          local ft = vim.bo.filetype
          if lint.linters_by_ft[ft] then
            -- Suppress errors if linter is not installed yet
            local ok, err = pcall(lint.try_lint)
            if not ok and not string.match(err, "ENOENT") then
              vim.notify("Linting error: " .. err, vim.log.levels.WARN)
            end
          end
        end,
      })

      -- Optional: Add keymap to manually trigger linting
      vim.keymap.set("n", "<leader>l", function()
        lint.try_lint()
      end, { desc = "Trigger linting for current file" })
    end,
  },
}
