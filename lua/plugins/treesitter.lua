return {
  -- Syntax Highlighting
  'nvim-treesitter/nvim-treesitter',
  branch = 'main', -- master does not support Neovim 0.12
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local languages = { "vim", "vimdoc", "lua", "http", "json", "astro", "typescript", "tsx", "javascript", "go" }

    require("nvim-treesitter").install(languages)

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
        if not lang or not vim.treesitter.language.add(lang) then
          return
        end

        vim.treesitter.start(args.buf, lang)

        -- treesitter-based indentation
        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
