# My masterpiece NVim Config

**Description:** My first config, minimal, fast, and working, which I am so proud of.

## Overview

This repository contains my personal Neovim configuration designed to be minimal yet powerful. It includes essential plugins and settings to enhance the Neovim experience.

## Features

- **Bootstrap lazy.nvim**: Automatically clones and sets up lazy.nvim.
- **General Settings**: Relative numbering, line numbering, and custom key mappings.
- **Key Mappings**: Custom key mappings for autocomplete and more.
- **Auto Commands**: Custom format options for different file types.
- **Leader Key**: Set leader key to space.
- **Plugin Management**: Managed using lazy.nvim with various plugins for different functionalities.

## Plugins Included

- **TokyoNight Theme**: A dark theme with transparent background support.
- **Comment.nvim**: Easy code commenting.
- **nvim-autopairs**: Automatic pairing of brackets and quotes.
- **Neoformat**: Auto formatting on save.
- **nvim-lspconfig**: LSP support for various languages (Python, Rust, Go, C++, Java, TypeScript, JavaScript, Zig).
- **nvim-cmp**: Autocompletion plugin with sources for LSP, buffer, and path.
- **LuaSnip**: Snippet engine and integration with nvim-cmp.
- **rust-tools.nvim**: Enhanced support for Rust development.
- **undotree**: Visualize and navigate undo history.
- **lualine.nvim**: Status line with icons and theme support.
- **harpoon**: Quick file navigation.
- **nvim-treesitter**: Enhanced syntax highlighting and code navigation.
- **telescope.nvim**: Fuzzy finder for files, live grep, and more.
- **toggleterm.nvim**: Integrated terminal with horizontal split.
- **GitHub Copilot**: AI-powered code suggestions.

## Installation

1. Clone this repository:
    ```sh
    git clone https://github.com/ZiadMostafaGit/My-masterpiece-NVim-config-which-simply-works.git ~/.config/nvim
    ```

2. Open Neovim and let `lazy.nvim` handle the rest:
    ```sh
    nvim
    ```

## Usage

- **Leader Key**: The leader key is set to space (` `).
- **Key Bindings**:
  - `<leader>pv`: Open file explorer.
  - `<leader>u`: Toggle Undo Tree.
  - `<leader>a`: Add file to Harpoon.
  - `<C-e>`: Toggle Harpoon quick menu.
  - `<leader>pf`: Search files in the current directory.
  - `<C-p>`: Search files in Git directories.
  - `<leader>ps`: Search files from the root directory, including hidden files.
  - `<leader>pg`: Search for a specific word in files.

## Contributing

Feel free to fork this repository and make your own changes. Contributions are welcome!

## License

This project is licensed under the MIT License.
