#!/usr/bin/env bash
set -e

PACKAGES=(
    mint
    robotsandpencils/made/xcodes
    swiftlint
    mitmproxy
    rbenv
    openvpn
    cocoapods
    xcodegen
    carthage
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
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Config XCode..."
sudo xcode-select -switch /Applications/Xcode.app

echo "Updating homebrew..."
brew update

echo "Installing packages..."
brew install ${PACKAGES[@]}

echo "Installing cask apps..."
brew install --cask ${CASKS[@]}

if ! [ -d ~/.oh-my-zsh ]; then
	echo "Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "Configuring git..."
git config --global user.name "Manh Pham"
git config --global user.email "manhpham90vn@icloud.com"
git config --global credential.helper osxkeychain

echo "Configuring OS..."
defaults write com.apple.Finder AppleShowAllFiles true
killall Finder

echo "Macbook setup completed!"
