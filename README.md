# Neovim Configuration

This is a modern Neovim configuration built from the ground up in Lua, specifically tailored for competitive programming. It's designed to be fast, lightweight, and packed with features to make you more efficient during contests.

## ✨ Features

* **Plugin Manager**: Uses [`packer.nvim`](https://github.com/wbthomason/packer.nvim) for fast, declarative plugin management.
* **Theme**: Beautiful and easy on the eyes, featuring the popular [`gruvbox.nvim`](https://github.com/ellisonleao/gruvbox.nvim) theme.
* **File Explorer**: A powerful file tree powered by [`nvim-tree.lua`](https://github.com/kyazdani42/nvim-tree.lua) for quick navigation.
* **IDE-like Experience**: Full Language Server Protocol (LSP) support via [`nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig) and [`mason.nvim`](https://github.com/williamboman/mason.nvim) for easy language server installation.
    * Autocompletion provided by [`nvim-cmp`](https://github.com/hrsh7th/nvim-cmp).
    * Support for C, C++, and Java out of the box.
* **Advanced Syntax Highlighting**: Uses [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter) for more accurate and intelligent code highlighting.
* **Automatic Templating**: Automatically populates new C++ files with your custom competitive programming template.
* **Quality of Life**:
    * `lualine.nvim`: A sleek and informative statusline.
    * `nvim-autopairs`: Automatically closes brackets, quotes, etc.
    * `luasnip`: For custom snippets.

## 🚀 Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/Maze-101/Neovim-Configuration ~/.config/nvim
    ```
2.  **Launch Neovim:**
    ```bash
    nvim
    ```
    The first time you launch Neovim, Packer will automatically install all the necessary plugins.

## ⌨️ Keymaps

The leader key is set to `Space`.

### General Navigation

| Keymap            | Description                                   |
| ----------------- | --------------------------------------------- |
| `<leader>v` | splits windows vertically. |
| `<C-h>`, `<C-j>`, `<C-k>`, `<C-l>` | Navigate between window splits (left, down, up, right) |
| `<leader>gd`        | Go to definition of the symbol under the cursor. |
| `<leader>gr`        | List all references to the symbol under the cursor. |
| `<leader>ca`        | Show available code actions (e.g., refactoring). |
| `K`                 | Show documentation for the symbol under the cursor.   |

### File Management

| Keymap       | Description                                            |
| ------------ | ------------------------------------------------------ |
| `<leader>e`  | Toggle the NvimTree file explorer.                     |
| `<leader>n`  | Create a new file in the current file's directory.      |

### Competitive Programming

| Keymap | Description                                                                               |
| ------ | ----------------------------------------------------------------------------------------- |
| `<F5>`   | **Compile & Run (File I/O)**: Compiles and runs the current C++ file, taking input from `input.txt` and writing output to `output.txt`. |
| `<F6>`   | **Compile & Run (Background)**: Compiles and runs the current C++ file in the background. |
| `<F7>`   | **Compile & Run (Interactive)**: Opens a vertical terminal, compiles, and runs the current C++ file for interactive input. |



