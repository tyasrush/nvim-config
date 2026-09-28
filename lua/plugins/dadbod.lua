return {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod',                     lazy = true },
    { 'tpope/vim-dotenv',                     lazy = false },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql', 'psql' }, lazy = true }, -- Optional
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_save_location = vim.fn.expand('~/Workspaces/databases')
    vim.g.db_ui_tmp_query_location = vim.fn.expand('~/Workspaces/databases/tmp')

    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('dadbod_result_height', { clear = true }),
      pattern = 'dbout',
      callback = function()
        -- Size once per window so manual resizes survive re-running a query
        if vim.w.dbout_sized then return end
        vim.w.dbout_sized = true
        vim.cmd.resize(math.floor(vim.o.lines * 0.4))
      end,
    })
  end,
}
