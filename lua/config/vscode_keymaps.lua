local map = vim.keymap.set
local vscode = require('vscode-neovim')

-- Helper function to call VSCode commands
local function vscode_action(cmd)
  return function()
    vscode.action(cmd)
  end
end

-- ========================================
-- Buffers (matching your config)
-- ========================================
map("n", "<S-h>", vscode_action("workbench.action.previousEditor"), { desc = "Prev Buffer" })
map("n", "<S-l>", vscode_action("workbench.action.nextEditor"), { desc = "Next Buffer" })
map("n", "[b", vscode_action("workbench.action.previousEditor"), { desc = "Prev Buffer" })
map("n", "]b", vscode_action("workbench.action.nextEditor"), { desc = "Next Buffer" })
map("n", "<leader>bb", vscode_action("workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup"), { desc = "Switch to Other Buffer" })
map("n", "<leader>`", vscode_action("workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup"), { desc = "Switch to Other Buffer" })
map("n", "<leader>bD", vscode_action("workbench.action.closeActiveEditor"), { desc = "Delete Buffer and Window" })

-- ========================================
-- Clear search and stop snippet on escape
-- ========================================
map({ "i", "n", "s" }, "<esc>", function()
  vim.cmd("noh")
  return "<esc>"
end, { expr = true, desc = "Escape and Clear hlsearch" })

-- ========================================
-- Clear search, diff update and redraw
-- ========================================
map(
  "n",
  "<leader>ur",
  "<Cmd>nohlsearch<Bar>normal! <C-L><CR>",
  { desc = "Redraw / Clear hlsearch / Diff Update" }
)

-- ========================================
-- Saner behavior of n and N
-- ========================================
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- ========================================
-- Save file
-- ========================================
map({ "i", "x", "n", "s" }, "<C-s>", vscode_action("workbench.action.files.save"), { desc = "Save File" })

-- ========================================
-- Better indenting
-- ========================================
map("v", "<", "<gv")
map("v", ">", ">gv")

-- ========================================
-- Commenting
-- ========================================
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })
map("n", "gcc", vscode_action("editor.action.commentLine"), { desc = "Toggle Comment Line" })
map("v", "gc", vscode_action("editor.action.commentLine"), { desc = "Toggle Comment" })

-- ========================================
-- New file
-- ========================================
map("n", "<leader>fn", vscode_action("workbench.action.files.newUntitledFile"), { desc = "New File" })

-- ========================================
-- Diagnostic
-- ========================================
map("n", "<leader>cd", vscode_action("editor.action.showHover"), { desc = "Line Diagnostics" })
map("n", "]d", vscode_action("editor.action.marker.next"), { desc = "Next Diagnostic" })
map("n", "[d", vscode_action("editor.action.marker.prev"), { desc = "Prev Diagnostic" })
map("n", "]e", vscode_action("editor.action.marker.nextInFiles"), { desc = "Next Error" })
map("n", "[e", vscode_action("editor.action.marker.prevInFiles"), { desc = "Prev Error" })
map("n", "]w", vscode_action("editor.action.marker.next"), { desc = "Next Warning" })
map("n", "[w", vscode_action("editor.action.marker.prev"), { desc = "Prev Warning" })
map("n", "]i", vscode_action("editor.action.marker.next"), { desc = "Next Info" })
map("n", "[i", vscode_action("editor.action.marker.prev"), { desc = "Prev Info" })

-- ========================================
-- Quit
-- ========================================
map("n", "<leader>qq", vscode_action("workbench.action.closeAllEditors"), { desc = "Quit All" })

-- ========================================
-- Telescope-like keybindings (matching your config)
-- ========================================
map("n", "<leader>g", vscode_action("workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup"), { desc = "Previous Buffer" })
map("n", "<leader>m", vscode_action("workbench.action.gotoSymbol"), { desc = "Marks/Symbols" })
map("n", "<leader><tab>", vscode_action("workbench.action.showAllEditors"), { desc = "Buffers" })
map({ "i", "n", "s" }, "<C-e>", vscode_action("workbench.action.findInFiles"), { desc = "Live Grep" })
map({ "i", "n", "s" }, "<C-p>", vscode_action("workbench.action.quickOpen"), { desc = "Find Files" })
map({ "i", "n", "s" }, "<leader>gs", vscode_action("workbench.view.scm"), { desc = "Git Status" })

-- ========================================
-- Additional VSCode-specific useful keymaps
-- ========================================
-- Code actions
map("n", "gd", vscode_action("editor.action.revealDefinition"), { desc = "Go to Definition" })
map("n", "gD", vscode_action("editor.action.revealDeclaration"), { desc = "Go to Declaration" })
map("n", "gr", vscode_action("editor.action.goToReferences"), { desc = "Go to References" })
map("n", "gI", vscode_action("editor.action.goToImplementation"), { desc = "Go to Implementation" })
map("n", "K", vscode_action("editor.action.showHover"), { desc = "Hover" })
map("n", "<leader>ca", vscode_action("editor.action.quickFix"), { desc = "Code Action" })
map("n", "<leader>cr", vscode_action("editor.action.rename"), { desc = "Rename" })

-- Window navigation
map("n", "<C-h>", vscode_action("workbench.action.navigateLeft"), { desc = "Go to Left Window" })
map("n", "<C-j>", vscode_action("workbench.action.navigateDown"), { desc = "Go to Lower Window" })
map("n", "<C-k>", vscode_action("workbench.action.navigateUp"), { desc = "Go to Upper Window" })
map("n", "<C-l>", vscode_action("workbench.action.navigateRight"), { desc = "Go to Right Window" })

-- Sidebar
map("n", "<leader>e", vscode_action("workbench.action.toggleSidebarVisibility"), { desc = "Toggle Sidebar" })
