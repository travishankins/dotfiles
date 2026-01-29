#!/usr/bin/env bash
set -e

echo "🍺 Homebrew Installation Script"
echo "================================"
echo ""

# Check if Homebrew is already installed
if command -v brew &> /dev/null; then
    echo "✅ Homebrew is already installed at: $(which brew)"
    echo "📊 Version: $(brew --version | head -n1)"
    echo ""
    read -p "Would you like to update Homebrew? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "⬆️  Updating Homebrew..."
        brew update
        echo "✅ Homebrew updated!"
    fi
else
    echo "📦 Homebrew is not installed. Installing now..."
    echo ""
    
    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH (required for both Intel and Apple Silicon)
    echo "🔧 Adding Homebrew to PATH..."
    echo >> ~/.zprofile
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
    
    echo ""
    echo "✅ Homebrew installed successfully!"
fi

echo ""
echo "🎯 Next steps:"
echo "1. Run './install-apps.sh' to install applications from Brewfile"
echo "2. Or run 'brew bundle --file=~/Developer/dotfiles/Brewfile' manually"
