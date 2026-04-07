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

### macOS
1. Create 5 virtual desktops in Mission Control
2. System Settings → Keyboard Shortcuts → Mission Control → assign Ctrl+1 to Ctrl+5
