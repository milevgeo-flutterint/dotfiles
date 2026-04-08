#!/bin/bash

DOTFILES=~/dotfiles

# Brew & Apps
bash $DOTFILES/brew.sh

# Zsh
ln -sf $DOTFILES/.zshrc ~/.zshrc

# Tmux
ln -sf $DOTFILES/.tmux.conf ~/.tmux.conf

# Git
ln -sf $DOTFILES/.gitconfig ~/.gitconfig

# Ghostty
mkdir -p ~/.config/ghostty
mkdir -p ~/Library/Application\ Support/com.mitchellh.ghostty
ln -sf $DOTFILES/ghostty.config ~/.config/ghostty/config.ghostty
ln -sf ~/.config/ghostty/config.ghostty ~/Library/Application\ Support/com.mitchellh.ghostty/config.ghostty

# LazyVim
mkdir -p ~/.config/nvim
ln -sf $DOTFILES/nvim ~/.config/nvim

# SSH
mkdir -p ~/.ssh
ln -sf $DOTFILES/ssh.config ~/.ssh/config
chmod 700 ~/.ssh

# Keyboard script
mkdir -p ~/scripts
ln -sf $DOTFILES/scripts/block_internal_keyboard.sh ~/scripts/block_internal_keyboard.sh
chmod +x ~/scripts/block_internal_keyboard.sh

# Launch Agent
mkdir -p ~/Library/LaunchAgents
ln -sf $DOTFILES/launchagents/com.user.keyboard.plist ~/Library/LaunchAgents/com.user.keyboard.plist
launchctl load ~/Library/LaunchAgents/com.user.keyboard.plist

# Chrome bookmarks
bash $DOTFILES/chrome/restore.sh

# macOS settings
bash $DOTFILES/macos.sh

if [ ! -f ~/.yarnrc.yml ]; then
  cp $DOTFILES/yarnrc.yml.template ~/.yarnrc.yml
  echo "⚠️  Don't forget to add your Artifactory token in ~/.yarnrc.yml"
fi

# Git config
git config --global user.name "milevgeo-flutterint"
git config --global user.email "georgi_milev@flutterint.com"
git config --global core.editor "nvim"
git config --global url."git@github.com:".insteadOf "https://github.com/"

echo "✅ Done!"
