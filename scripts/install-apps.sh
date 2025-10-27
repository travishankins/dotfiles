#!/usr/bin/env bash
set -e

DOTFILES_DIR="$HOME/Developer/dotfiles"
BREWFILE="$DOTFILES_DIR/Brewfile"

echo "📦 Application Installation Script"
echo "==================================="
echo ""

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "❌ Homebrew is not installed!"
    echo "Please run './install-homebrew.sh' first."
    exit 1
fi

echo "✅ Homebrew found: $(which brew)"
echo ""

# Check if Brewfile exists
if [ ! -f "$BREWFILE" ]; then
    echo "❌ Brewfile not found at: $BREWFILE"
    exit 1
fi

echo "📋 Brewfile found at: $BREWFILE"
echo ""
echo "This will install the following packages and applications:"
echo ""

# Show what will be installed
brew bundle list --file="$BREWFILE"

echo ""
read -p "Do you want to proceed with the installation? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Installation cancelled."
    exit 0
fi

echo ""
echo "🚀 Installing packages and applications..."
echo ""

# Install from Brewfile
brew bundle install --file="$BREWFILE" --verbose

echo ""
echo "✅ Installation complete!"
echo ""

# Install VSCode extensions
if command -v code &> /dev/null; then
    echo "📦 Installing VSCode extensions..."
    
    # Read extensions from vscode/extensions.json
    if [ -f "$DOTFILES_DIR/vscode/extensions.json" ]; then
        extensions=$(grep -o '"[^"]*"' "$DOTFILES_DIR/vscode/extensions.json" | grep -v "recommendations" | tr -d '"' | tr -d ',')
        
        for ext in $extensions; do
            echo "Installing: $ext"
            code --install-extension "$ext" --force
        done
        
        echo "✅ VSCode extensions installed!"
    fi
else
    echo "⚠️  VSCode not found in PATH. Skipping extension installation."
    echo "   Run this script again after installing VSCode to install extensions."
fi

echo ""
echo "🎉 All done!"
echo ""
echo "🔧 Recommended next steps:"
echo "1. Run './install.sh' to set up your dotfiles"
echo "2. Run 'brew cleanup' to remove old versions"
echo "3. Restart your terminal to apply all changes"
