local api = vim.api
local cmd = vim.cmd

-- Detect if running inside VSCode with vscode-neovim extension
if vim.g.vscode then
  -- VSCode-neovim extension: use VSCode's functionality
  vim.g.vscode_neovim = true
  
  -- Load VSCode-specific keymaps
  require("config.vscode-keymaps")
else
  -- ordinary Neovim
  vim.o.showmatch = true
  vim.o.hlsearch = true
  vim.o.number = true
  vim.o.relativenumber = true
  vim.o.autoindent = true
  vim.o.expandtab = true
  vim.o.cc = "80"
  vim.o.tabstop = 2
  vim.o.shiftwidth = 2
  vim.o.softtabstop = 2
  vim.o.clipboard = 'unnamedplus'
  vim.o.foldmethod = 'syntax'
  vim.o.foldlevelstart = 99

  require("config.lazy");
  require("config.keymaps");
  require("config.autocomplete");
  require("config.formatting");
  require("config.lsp");
  require("config.dap");

  cmd.colorscheme "catppuccin-mocha"
end
