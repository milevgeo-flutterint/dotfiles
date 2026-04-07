#!/bin/bash

# Install Homebrew if missing
if ! command -v brew &> /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# CLI tools
brew install git
brew install neovim
brew install tmux
brew install fnm
brew install yarn
brew install ripgrep
brew install fd
brew install fzf
brew install lazygit
brew install zsh
brew install powerlevel10k
brew install zsh-autosuggestions

# Apps
brew install --cask ghostty
brew install --cask visual-studio-code
brew install --cask google-chrome
brew install --cask slack
brew install --cask zoom
brew install --cask microsoft-outlook

# Node via fnm
eval "$(fnm env)"
fnm install --lts
fnm use --lts

# Global npm packages
npm install -g nx

echo "✅ Brew done!"
