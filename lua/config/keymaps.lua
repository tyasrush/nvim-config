local map = vim.keymap.set

-- Check if running in VSCode with vscode-neovim
local is_vscode = vim.g.vscode or vim.g.vscode_neovim

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })


-- Clear search and stop snippet on escape
map({ "i", "n", "s" }, "<esc>", function()
  vim.cmd("noh")
  return "<esc>"
end, { expr = true, desc = "Escape and Clear hlsearch" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map(
  "n",
  "<leader>ur",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "Redraw / Clear hlsearch / Diff Update" }
)

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- better indenting (test comment)
map("v", "<", "<gv")
map("v", ">", ">gv")

-- commenting
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })
map("n", "]i", diagnostic_goto(true, "INFO"), { desc = "Next Info" })
map("n", "[i", diagnostic_goto(false, "INFO"), { desc = "Prev Info" })
-- test

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- Telescope / VSCode navigation
if is_vscode then
  -- In VSCode, use native VSCode commands instead of Telescope
  map("n", "<leader>g", "<cmd>workbench.action.quickOpenPreviousEditor<cr>", { desc = "Quick Open Previous Editor" })
  map("n", "<leader>m", "<cmd>workbench.action.gotoSymbol<cr>", { desc = "Go to Symbol" })
  map("n", "<leader><tab>", "<cmd>workbench.action.showAllEditors<cr>", { desc = "Show All Editors" })
  map({ "i", "n", "s" }, "<C-e>", "<cmd>workbench.action.findInFiles<cr>", { desc = "Find in Files" })
  map({ "i", "n", "s" }, "<C-p>", "<cmd>workbench.action.quickOpen<cr>", { desc = "Quick Open" })
  map("n", "<leader>gs", "<cmd>gitlens.showQuickRepoStatus<cr>", { desc = "Git Status" })
else
  local builtin = require('telescope.builtin')
  map("n", "<leader>g", vim.cmd(':b#'))
  map("n", "<leader>m", builtin.marks)
  map("n", "<leader><tab>", builtin.buffers)
  map({ "i", "n", "s" }, "<C-e>", builtin.live_grep)
  map({ "i", "n", "s" }, "<C-p>", builtin.find_files)
  map({ "i", "n", "s" }, "<leader>gs", builtin.git_status)
end
