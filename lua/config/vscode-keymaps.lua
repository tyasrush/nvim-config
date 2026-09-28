-- Keymaps for VSCode (vscode-neovim extension)
-- Mirrors the Neovim keymaps using VSCode commands

local map = vim.keymap.set

-- ========== Buffers ==========
map("n", "<S-h>", "<cmd>workbench.action.previousEditor<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>workbench.action.nextEditor<cr>", { desc = "Next Buffer" })
map("n", "[b", "<cmd>workbench.action.previousEditor<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>workbench.action.nextEditor<cr>", { desc = "Next Buffer" })
map("n", "<leader>bb", "<cmd>workbench.action.openEditorAtIndex2<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>workbench.action.openEditorAtIndex2<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bD", "<cmd>workbench.action.closeActiveEditor<cr>", { desc = "Delete Buffer and Window" })

-- ========== Search / Escape ==========
-- Escape is handled by vscode-neovim composite keys in settings

-- ========== Clear Search Highlight ==========
map("n", "<leader>ur", "<cmd>nohlsearch<cr>", { desc = "Clear Highlight Search" })

-- ========== Search Navigation (n/N) ==========
-- Handled by Neovim natively in vscode-neovim

-- ========== Save File ==========
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>workbench.action.files.save<cr>", { desc = "Save File" })

-- ========== Indenting ==========
-- Handled by Neovim natively in vscode-neovim

-- ========== Commenting ==========
-- Handled by Neovim natively in vscode-neovim (gco, gcO)

-- ========== Lazy (not available in VSCode) ==========
map("n", "<leader>l", function()
  vim.notify("Use VSCode extensions panel for plugin management", vim.log.levels.INFO)
end, { desc = "Lazy hint" })

-- ========== New File ==========
map("n", "<leader>fn", "<cmd>workbench.action.files.newUntitledFile<cr>", { desc = "New File" })

-- ========== Diagnostics ==========
map("n", "<leader>cd", "<cmd>editor.action.showHover<cr>", { desc = "Line Diagnostics" })
map("n", "]d", "<cmd>editor.action.marker.nextInFiles<cr>", { desc = "Next Diagnostic" })
map("n", "[d", "<cmd>editor.action.marker.prevInFiles<cr>", { desc = "Prev Diagnostic" })
map("n", "]e", "<cmd>editor.action.marker.nextInFiles<cr>", { desc = "Next Error" })
map("n", "[e", "<cmd>editor.action.marker.prevInFiles<cr>", { desc = "Prev Error" })
map("n", "]w", "<cmd>editor.action.marker.nextInFiles<cr>", { desc = "Next Warning" })
map("n", "[w", "<cmd>editor.action.marker.prevInFiles<cr>", { desc = "Prev Warning" })
map("n", "]i", "<cmd>editor.action.marker.nextInFiles<cr>", { desc = "Next Info" })
map("n", "[i", "<cmd>editor.action.marker.prevInFiles<cr>", { desc = "Prev Info" })

-- ========== Quit ==========
map("n", "<leader>qq", "<cmd>workbench.action.quit<cr>", { desc = "Quit All" })

-- ========== Navigation (Telescope alternatives) ==========
map("n", "<leader>g", "<cmd>workbench.action.quickOpenPreviousEditor<cr>", { desc = "Quick Open Previous" })
map("n", "<leader>m", "<cmd>workbench.action.gotoSymbol<cr>", { desc = "Go to Symbol" })
map("n", "<leader><tab>", "<cmd>workbench.action.showAllEditors<cr>", { desc = "Show All Editors" })
map({ "i", "n", "s" }, "<C-e>", "<cmd>workbench.action.findInFiles<cr>", { desc = "Find in Files" })
map({ "i", "n", "s" }, "<C-p>", "<cmd>workbench.action.quickOpen<cr>", { desc = "Quick Open" })
map("n", "<leader>gs", "<cmd>gitlens.showQuickRepoStatus<cr>", { desc = "Git Status" })

-- ========== LSP Navigation ==========
map("n", "gi", "<cmd>editor.action.goToImplementation<cr>", { desc = "Go to Implementation" })
map("n", "gd", "<cmd>editor.action.revealDefinition<cr>", { desc = "Go to Definition" })
map("n", "gr", "<cmd>editor.action.goToReferences<cr>", { desc = "Go to References" })
map("n", "gds", "<cmd>workbench.action.gotoSymbol<cr>", { desc = "Go to Document Symbol" })
map("n", "gws", "<cmd>workbench.action.gotoSymbolInWorkspace<cr>", { desc = "Go to Workspace Symbol" })
map("n", "K", "<cmd>editor.action.showHover<cr>", { desc = "Show Hover" })
