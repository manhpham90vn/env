#!/usr/bin/env bash

PACKAGES=(
    mint
    robotsandpencils/made/xcodes
    swiftlint
    mitmproxy
    rbenv
    openvpn
)

RUBY_GEMS=(
    cocoapods
)

CASKS=(
    iterm2 
    google-chrome 
    sourcetree 
    visual-studio-code
)

echo "Starting setup"

if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Updating homebrew..."
brew update

echo "Installing packages..."
brew install ${PACKAGES[@]}

echo "Installing Ruby gems"
sudo gem install ${RUBY_GEMS[@]}

echo "Installing cask apps..."
brew install --cask ${CASKS[@]}

echo "Configuring OS..."
defaults write com.apple.Finder AppleShowAllFiles true
killall Finder

echo "Macbook setup completed!"
