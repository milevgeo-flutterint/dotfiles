#!/bin/bash

# Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock show-recents -bool false  # не показва скорошни апове
defaults write com.apple.dock static-only -bool true    # само pinned апове

# Dock apps - изчисти и добави само твоите
defaults delete com.apple.dock persistent-apps 2>/dev/null

add_app() {
  defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>$1</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
}

add_app "/System/Library/CoreServices/Finder.app"
add_app "/Applications/Microsoft Outlook.app"
add_app "/Applications/zoom.us.app"
add_app "/Applications/Slack.app"
add_app "/Applications/Google Chrome.app"
add_app "/com.apple.ghostty" 
add_app "/Applications/Visual Studio Code.app"

# Mission Control - подреждане по номер
defaults write com.apple.spaces spans-displays -bool false
defaults write com.apple.dock mru-spaces -bool false  # не пренарежда spaces автоматично

# Key repeat
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Trackpad speed
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 2.5

killall Dock

echo "✅ macOS settings done!"
