local api = vim.api
local cmd = vim.cmd

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

require("config.lazy");
require("config.keymaps");
require("config.autocomplete");
require("config.formatting");
require("config.lsp");

cmd.colorscheme "catppuccin-mocha"
