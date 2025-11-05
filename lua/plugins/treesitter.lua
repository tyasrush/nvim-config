return {
  -- Syntax Highlighting
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    options = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = { "vim", "lua", "http", "json", "astro", "typescript", "tsx", "javascript", "go" }
    }
}
