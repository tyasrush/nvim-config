# VSCode-neovim Setup Guide

## Installation

### 1. Install the vscode-neovim Extension
- Open VSCode → Extensions (`Ctrl+Shift+X`)
- Search for **"vscode-neovim"** (by Alexander Svetliakov)
- Install it

### 2. Copy Configuration Files

#### Settings
1. Open VSCode Settings: `Ctrl+,` → Click "{}" icon (top right)
   - Or go to: `~/.config/Code/User/settings.json`
2. Copy contents from: `~/.config/nvim/vscode-settings.json`

#### Keybindings
1. Open VSCode Keyboard Shortcuts: `Ctrl+K Ctrl+S` → Click "{}" icon
   - Or go to: `~/.config/Code/User/keybindings.json`
2. Copy contents from: `~/.config/nvim/vscode-keybindings.json`

---

## Keymap Parity

Your Neovim keymaps are mirrored in VSCode. Here's the mapping:

### Buffers
| Key | Neovim Command | VSCode Command |
|-----|----------------|----------------|
| `Shift+H` | `:bprevious` | `workbench.action.previousEditor` |
| `Shift+L` | `:bnext` | `workbench.action.nextEditor` |
| `[b` | `:bprevious` | `workbench.action.previousEditor` |
| `]b` | `:bnext` | `workbench.action.nextEditor` |
| `<leader>bb` | `:e #` | `workbench.action.openEditorAtIndex2` |
| `<leader>\`` | `:e #` | `workbench.action.openEditorAtIndex2` |
| `<leader>bD` | `:bd` | `workbench.action.closeActiveEditor` |

### Search
| Key | Neovim Command | VSCode Command |
|-----|----------------|----------------|
| `<leader>ur` | `:nohlsearch` | `:nohlsearch` |
| `n` | Search next | Native (Neovim) |
| `N` | Search prev | Native (Neovim) |
| `Ctrl+Space Ctrl+U Ctrl+R` | Find with selection | `actions.findWithSelection` |

### File Operations
| Key | Neovim Command | VSCode Command |
|-----|----------------|----------------|
| `Ctrl+S` | `:w` | `workbench.action.files.save` |
| `<leader>fn` | `:enew` | `workbench.action.files.newUntitledFile` |
| `<leader>qq` | `:qa` | `workbench.action.quit` |

### Diagnostics
| Key | Neovim Command | VSCode Command |
|-----|----------------|----------------|
| `<leader>cd` | `vim.diagnostic.open_float` | `editor.action.showHover` |
| `]d` / `[d` | goto_next/prev | `editor.action.marker.nextInFiles/prevInFiles` |
| `]e` / `[e` | goto error | `editor.action.marker.nextInFiles/prevInFiles` |
| `]w` / `[w` | goto warning | `editor.action.marker.nextInFiles/prevInFiles` |
| `]i` / `[i` | goto info | `editor.action.marker.nextInFiles/prevInFiles` |

### Navigation (Telescope ↔ VSCode)
| Key | Neovim (Telescope) | VSCode Equivalent |
|-----|-------------------|-------------------|
| `Ctrl+P` | `find_files` | `workbench.action.quickOpen` |
| `Ctrl+E` | `live_grep` | `workbench.action.findInFiles` |
| `<leader>g` | `:b#` | `workbench.action.quickOpenPreviousEditor` |
| `<leader>m` | `builtin.marks` | `workbench.action.gotoSymbol` |
| `<leader><tab>` | `builtin.buffers` | `workbench.action.showAllEditors` |
| `<leader>gs` | `builtin.git_status` | `gitlens.showQuickRepoStatus` |

### Indenting
| Key | Neovim Command | VSCode Command |
|-----|----------------|----------------|
| `>` (visual) | `>gv` | `editor.action.indentLines` |
| `<` (visual) | `<gv` | `editor.action.outdentLines` |

### Commenting
| Key | Neovim Command | VSCode Command |
|-----|----------------|----------------|
| `gco` | Add comment below | `editor.action.insertLineAfter` |
| `gcO` | Add comment above | `editor.action.insertLineBefore` |

---

## Special Features

### Composite Escape Key
Press `jj` in insert mode to exit (configured in settings)

### VSCode-Specific Notes
- Most Vim keybindings work **natively** through vscode-neovim
- Leader key (`<Space>`) works the same as in Neovim
- Telescope commands are replaced with VSCode equivalents
- Some Neovim plugins may not work in VSCode (handled by `vim.g.vscode` check)

---

## Troubleshooting

### Keybindings not working?
1. Check if vscode-neovim extension is enabled
2. Verify Neovim path in settings: `"vscode-neovim.neovimExecutablePaths.linux": "/usr/bin/nvim"`
3. Restart VSCode

### View logs
- Output → Focus on Output View → select `vscode-neovim`

### Restart extension
- Command Palette (`Ctrl+Shift+P`) → `Neovim: Restart Extension`
