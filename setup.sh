#!/usr/bin/env bash
set -e

PACKAGES=(
    mint
    robotsandpencils/made/xcodes
    swiftlint
    rbenv
    cocoapods
    xcodegen
    carthage
    openssl
    libxml2
)

CASKS=(
    iterm2 
    google-chrome 
    sourcetree 
    visual-studio-code
    openvpn-connect
    charles
    android-studio
)

echo "Starting setup"

if ! [ -d ~/.oh-my-zsh ]; then
	echo "Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    exit
fi

if [ $(uname -m) == "arm64" ]; then
    BREW_CMD="/opt/homebrew/bin/brew"
else
    BREW_CMD="/usr/local/Homebrew/bin/brew"
fi

if ! [ -e $BREW_CMD ]; then
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    exit
fi

echo "Config XCode..."
sudo xcode-select -switch /Applications/Xcode.app

echo "Updating homebrew..."
$BREW_CMD update

echo "Installing packages..."
$BREW_CMD install ${PACKAGES[@]}

echo "Installing cask apps..."
$BREW_CMD install --cask ${CASKS[@]}

echo "Configuring git..."
git config --global user.name "Manh Pham"
git config --global user.email "manhpham90vn@icloud.com"
git config --global credential.helper osxkeychain

echo "Configuring OS..."
defaults write com.apple.Finder AppleShowAllFiles true
killall Finder

echo "Configuring XCodes..."
defaults write com.apple.dt.Xcode ShowBuildOperationDuration YES

echo "Macbook setup completed!"
