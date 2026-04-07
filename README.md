# Dotfiles

## Setup
1. Clone repo: `git clone git@github.com:milevgeo-flutterint/dotfiles.git`
2. Run: `bash install.sh`

## Manual steps after install

### SSH key
1. Generate: `ssh-keygen -t ed25519 -C "your@email.com"`
2. Copy public key: `cat ~/.ssh/id_ed25519.pub`
3. Add to GitHub: https://github.com/settings/keys
4. Add to ssh-agent: `eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_ed25519`

### Artifactory token
1. Go to https://artifactory.pyrsoftware.ca
2. Set Me Up → NPM → npm-all → generate token
3. Add to ~/.yarnrc.yml

### Virtual Desktops
1. Open Mission Control (F3)
2. Create 5 desktops
3. System Settings → Keyboard → Keyboard Shortcuts → Mission Control
4. Assign Ctrl+1 to Ctrl+5 for each desktop

### App assignment to desktops
1. Open each app on the correct desktop:
   - Desktop 1: Chrome
   - Desktop 2: Ghostty
   - Desktop 3: Slack
   - Desktop 4: Outlook
   - Desktop 5: everything else
2. Right click on each app in Dock → Options → Assign To → This Desktop

### Ghostty font
1. Already set in ghostty.config (JetBrainsMono Nerd Font)
2. If missing: `brew install --cask font-jetbrains-mono-nerd-font`

### Tmux plugins
1. Open tmux
2. Press Ctrl+a + I to install plugins

### LazyVim
1. Open nvim
2. Wait for all plugins to install automatically

### Artifactory yarn config
1. Copy template: `cp ~/dotfiles/yarnrc.yml.template ~/.yarnrc.yml`
2. Add your token to ~/.yarnrc.yml

### macOS keyboard fix (§ and ~ swap)
- Runs automatically via Launch Agent on every boot
- To reset: `bash ~/scripts/block_internal_keyboard.sh reset`
