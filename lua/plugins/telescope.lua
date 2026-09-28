return {
  { 'nvim-lua/plenary.nvim' },
  {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local previewers = require 'telescope.previewers'

      -- nvim-treesitter `main` branch dropped the `parsers.ft_to_lang` /
      -- `configs` modules that telescope's built-in ts highlighter still calls,
      -- so drive treesitter ourselves with the core API instead.
      local function buffer_previewer_maker(filepath, bufnr, opts)
        opts = opts or {}
        -- `{ enable = false }` rather than plain `false`: telescope resolves this
        -- field with a truthiness check, so `false` silently falls back to config.
        opts.preview = vim.tbl_extend("force", opts.preview or {}, {
          treesitter = { enable = false },
        })

        previewers.buffer_previewer_maker(filepath, bufnr, vim.tbl_extend("force", opts, {
          callback = function(buf)
            local ft = opts.ft or vim.filetype.match { filename = filepath, buf = buf }
            local lang = ft and vim.treesitter.language.get_lang(ft)
            if lang and pcall(vim.treesitter.language.add, lang) then
              pcall(vim.treesitter.start, buf, lang)
            end
            if opts.callback then
              opts.callback(buf)
            end
          end,
        }))
      end

      require('telescope').setup {
        defaults = {
          dynamic_preview_title = true,
          buffer_previewer_maker = buffer_previewer_maker,
          path_display = {
            filename_first = {
                reverse_directories = true
            }
          }
        }
      }
    end,
    keys = {
      {
        "<leader>,",
        "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
        desc = "Switch Buffer",
      },
      { "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Grep (Root Dir)" },
      { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      -- find
      {
        "<leader>fb",
        "<cmd>Telescope buffers sort_mru=true sort_lastused=true ignore_current_buffer=true<cr>",
        desc = "Buffers",
      },
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files (Root Dir)" },
      { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Find Files (git-files)" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      -- git
      { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "Commits" },
      { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "Status" },
      -- search
      { '<leader>s"', "<cmd>Telescope registers<cr>", desc = "Registers" },
      { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
      { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
      { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document Diagnostics" },
      { "<leader>sD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace Diagnostics" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
      { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
      { "<leader>sj", "<cmd>Telescope jumplist<cr>", desc = "Jumplist" },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
      { "<leader>sl", "<cmd>Telescope loclist<cr>", desc = "Location List" },
      { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
      { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
      { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
      { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
      { "<leader>sq", "<cmd>Telescope quickfix<cr>", desc = "Quickfix List" },
      { "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "Word (Root Dir)" },
    }
  }
}
