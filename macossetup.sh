#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Function to print messages with separators
echo_msg() {
    echo "========================================"
    echo "$1"
    echo "========================================"
}

# Install Homebrew if it's not already installed
if ! command -v brew &> /dev/null; then
    echo_msg "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo_msg "Homebrew is already installed."
fi

# Ensure Homebrew is up-to-date
echo_msg "Updating Homebrew..."
brew update

# Install 'mas' if it's not already installed
if ! brew list mas &> /dev/null; then
    echo_msg "Installing 'mas' (Mac App Store CLI)..."
    brew install mas
else
    echo_msg "'mas' is already installed."
fi

# Install Homebrew formulae (standard command-line tools)
echo_msg "Installing Homebrew formulae..."
brew install git

# Tap additional Homebrew repositories if needed
echo_msg "Tapping additional Homebrew repositories..."
brew tap nikitabobko/tap

# Define an array of Homebrew Cask applications to install
echo_msg "Installing Homebrew Cask applications..."
casks=(
    alacritty
    keka
    alfred
    syntax-highlight
    1password
    1password-cli
    brave-browser
    appcleaner
    audacity
    atext
    bartender
    aerospace
    bbedit
    betterdisplay
    calibre
    cleanshot
    chatgpt
    discord
    iina
    intellij-idea
    pycharm
    istat-menus
    keyboard-maestro
    keycastr
    keymapp
    maccy
    mission-control-plus
    mullvadvpn
    nvidia-geforce-now
    obsidian
    pdf-expert
    qbittorrent
    replacicon
    remnote
    simpletex
    soundsource
    spotify
    telegram
    texifier
    tor-browser
    zotero
)

# Loop through the cask array and install each application if not already installed
for cask in "${casks[@]}"; do
    if brew list --cask "$cask" &> /dev/null; then
        echo "✅ '$cask' is already installed."
    else
        echo "🚀 Installing '$cask'..."
        brew install --cask "$cask"
    fi
done

# Define an array of Mac App Store (MAS) application IDs to install
echo_msg "Installing Mac App Store applications..."
mas_ids=(
    1423210932  # Example App Name
    937984704   # Example App Name
    904280696   # Example App Name
    1435957248  # Example App Name
    634148309   # Example App Name
)

# Loop through the MAS IDs and install each application
for id in "${mas_ids[@]}"; do
    echo "📥 Installing MAS app with ID: $id..."
    mas install "$id"
done

# Final completion message
echo_msg "✅ Setup complete! All applications have been installed."
