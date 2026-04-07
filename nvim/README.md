# LazyVim Dotfiles Notes

This Neovim setup is based on LazyVim and uses fzf-lua for file picking plus LazyGit integration.

## What Was Missing

The two missing tools that caused breakage were:

- fzf (needed for fuzzy finding)
- lazygit (needed for the git UI command/mapping)

## Required Tools

Install these for the current config to work well:

- neovim
- git
- ripgrep
- fd
- fzf
- lazygit
- node

Notes:

- node is needed for TypeScript language tooling used by the LazyVim extras in this config.
- ripgrep and fd are used by pickers for fast file/text search.

## Optional But Recommended

- a Nerd Font (for icons)
- tree-sitter build tools (Xcode Command Line Tools on macOS)

## macOS Bootstrap

From this directory:

1. Install Homebrew packages:

	brew bundle --file Brewfile

2. Start Neovim and sync plugins:

	:Lazy sync

3. Install LSP/formatter tools via Mason (if needed):

	:Mason

## Health Checks

Inside Neovim:

- :checkhealth
- :checkhealth fzf_lua
- :checkhealth lazy
