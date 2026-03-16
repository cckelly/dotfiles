# Keybindings

This config follows a **vi-everywhere** philosophy — VI mode is enabled in zsh, tmux, and Neovim. Arrow keys are intentionally **disabled** across all tools to enforce hjkl muscle memory.

---

## Table of Contents

- [Global Navigation](#global-navigation)
- [tmux](#tmux)
- [Neovim](#neovim)
  - [Core](#core)
  - [Telescope (Search)](#telescope-search)
  - [LSP](#lsp)
  - [Git (Gitsigns)](#git-gitsigns)
  - [Debug (DAP)](#debug-dap)
  - [Plugins](#plugins)
- [Zsh](#zsh)
- [Ghostty](#ghostty)

---

## Global Navigation

`Ctrl+h/j/k/l` moves focus seamlessly between **tmux panes and Neovim splits** via `vim-tmux-navigator` — no prefix needed.

| Binding  | Action                 |
| -------- | ---------------------- |
| `Ctrl+h` | Focus left pane/split  |
| `Ctrl+j` | Focus down pane/split  |
| `Ctrl+k` | Focus up pane/split    |
| `Ctrl+l` | Focus right pane/split |

---

## tmux

**Prefix:** `Ctrl+Space`

### Sessions & Windows

| Binding      | Action                            |
| ------------ | --------------------------------- |
| `prefix + s` | Session tree (interactive)        |
| `prefix + S` | Switch to last session            |
| `prefix + c` | New window (in current directory) |
| `prefix + W` | Switch to last window             |
| `prefix + <` | Move window left                  |
| `prefix + >` | Move window right                 |
| `prefix + X` | Kill window (with prompt)         |
| `prefix + Q` | Kill server (with confirmation)   |

### Panes

| Binding      | Action                      |
| ------------ | --------------------------- |
| `prefix + \` | Split pane horizontally     |
| `prefix + -` | Split pane vertically       |
| `prefix + m` | Zoom/maximize pane (toggle) |
| `prefix + e` | Equalize pane sizes         |
| `prefix + x` | Kill pane (no confirmation) |

### Pane Resizing

| Binding            | Action                 |
| ------------------ | ---------------------- |
| `prefix + h/j/k/l` | Resize pane by 1 cell  |
| `prefix + H/J/K/L` | Resize pane by 5 cells |

### Copy Mode (vi keys)

| Binding          | Action                      |
| ---------------- | --------------------------- |
| `prefix + Enter` | Enter copy mode             |
| `v`              | Begin selection             |
| `V`              | Select line                 |
| `y`              | Copy selection to clipboard |

### Other

| Binding      | Action             |
| ------------ | ------------------ |
| `prefix + r` | Reload tmux config |

---

## Neovim

**Leader key:** `Space`

### Core

| Binding      | Mode     | Action                          |
| ------------ | -------- | ------------------------------- |
| `<Esc>`      | Normal   | Clear search highlights         |
| `<Esc><Esc>` | Terminal | Exit terminal mode              |
| `<S-l>`      | Normal   | Next buffer                     |
| `<S-h>`      | Normal   | Previous buffer                 |
| `<leader>q`  | Normal   | Open diagnostic quickfix list   |
| `<leader>f`  | Normal   | Format buffer (Conform)         |
| `<leader>ui` | Normal   | Toggle indent guides            |
| `\`          | Normal   | Toggle file explorer (Neo-tree) |

### Telescope (Search)

All bindings are prefixed with `<leader>s` — think **[S]earch**.

| Binding            | Action                       |
| ------------------ | ---------------------------- |
| `<leader><leader>` | Find open buffers            |
| `<leader>/`        | Fuzzy find in current buffer |
| `<leader>sf`       | Find files                   |
| `<leader>sg`       | Live grep                    |
| `<leader>sw`       | Grep current word            |
| `<leader>s/`       | Live grep in open files      |
| `<leader>sh`       | Search help tags             |
| `<leader>sk`       | Search keymaps               |
| `<leader>ss`       | Select Telescope picker      |
| `<leader>sd`       | Search diagnostics           |
| `<leader>sr`       | Resume last search           |
| `<leader>s.`       | Recent files                 |
| `<leader>sc`       | Search commands              |
| `<leader>sn`       | Find Neovim config files     |

### LSP

| Binding      | Mode          | Action                |
| ------------ | ------------- | --------------------- |
| `grn`        | Normal        | Rename symbol         |
| `gra`        | Normal/Visual | Code action           |
| `grd`        | Normal        | Go to definition      |
| `grr`        | Normal        | Go to references      |
| `gri`        | Normal        | Go to implementation  |
| `grt`        | Normal        | Go to type definition |
| `grD`        | Normal        | Go to declaration     |
| `gO`         | Normal        | Document symbols      |
| `gW`         | Normal        | Workspace symbols     |
| `<leader>th` | Normal        | Toggle inlay hints    |

---

## Zsh

VI mode is enabled (`bindkey -v`). Arrow keys are **disabled** — use hjkl in command mode.

| Binding  | Mode            | Action                                         |
| -------- | --------------- | ---------------------------------------------- |
| `v`      | Command (vicmd) | Edit current command in `$EDITOR`              |
| `Ctrl+E` | Insert (viins)  | Accept autosuggestion                          |
| `Ctrl+R` | —               | fzf history search (via fzf shell integration) |
| `Ctrl+T` | —               | fzf file search                                |
| `Alt+C`  | —               | fzf directory change                           |

---

## Ghostty

| Binding  | Action                                     |
| -------- | ------------------------------------------ |
| `Ctrl+[` | Send `ESC` (for zsh VI mode compatibility) |
