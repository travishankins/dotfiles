#!/usr/bin/env bash
set -e

DOTFILES_DIR="$HOME/Developer/dotfiles"
SCRIPTS_DIR="$DOTFILES_DIR/scripts"

echo "🚀 Dotfiles Installation & Setup"
echo "================================="
echo ""
echo "This script will:"
echo "  1. Install Xcode Command Line Tools"
echo "  2. Install Homebrew"
echo "  3. Install applications from Brewfile"
echo "  4. Install Oh My Zsh and plugins"
echo "  5. Create symbolic links for dotfiles"
echo "  6. Configure macOS system defaults"
echo ""
read -p "Do you want to proceed with the full setup? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Setup cancelled."
    exit 0
fi

echo ""
echo "========================================"
echo "Step 1: Xcode Command Line Tools"
echo "========================================"
echo ""

# Check if Xcode Command Line Tools are installed
if xcode-select -p &>/dev/null; then
    echo "✅ Xcode Command Line Tools already installed"
else
    echo "📦 Installing Xcode Command Line Tools..."
    xcode-select --install
    echo "⏳ Please complete the Xcode Command Line Tools installation in the popup window."
    echo "   Press any key to continue after installation completes..."
    read -n 1 -s -r
    echo ""
fi

echo ""
echo "========================================"
echo "Step 2: Homebrew Installation"
echo "========================================"
echo ""

"$SCRIPTS_DIR/install-homebrew.sh"

echo ""
echo "========================================"
echo "Step 3: Application Installation"
echo "========================================"
echo ""

"$SCRIPTS_DIR/install-apps.sh"

echo ""
echo "========================================"
echo "Step 4: Oh My Zsh & Plugins"
echo "========================================"
echo ""

# Install Oh My Zsh if it doesn't exist
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "📦 Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "✅ Oh My Zsh already installed"
fi

# Install zsh-autosuggestions plugin
ZSH_PLUGINS_DIR="$HOME/.oh-my-zsh/custom/plugins"
if [ ! -d "$ZSH_PLUGINS_DIR/zsh-autosuggestions" ]; then
    echo "💡 Installing zsh-autosuggestions plugin..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_PLUGINS_DIR/zsh-autosuggestions"
    echo "✅ zsh-autosuggestions installed"
else
    echo "✅ zsh-autosuggestions already installed"
fi

# Install zsh-syntax-highlighting plugin
if [ ! -d "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting" ]; then
    echo "🎨 Installing zsh-syntax-highlighting plugin..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting"
    echo "✅ zsh-syntax-highlighting installed"
else
    echo "✅ zsh-syntax-highlighting already installed"
fi

echo ""
echo "========================================"
echo "Step 5: Dotfiles Symbolic Links"
echo "========================================"
echo ""

"$SCRIPTS_DIR/link-dotfiles.sh"

echo ""
echo "========================================"
echo "Step 6: macOS System Defaults"
echo "========================================"
echo ""

"$SCRIPTS_DIR/macos-defaults.sh"

echo ""
echo "========================================"
echo "🎉 Setup Complete!"
echo "========================================"
echo ""
echo "📁 Original files backed up with .backup extension if they existed."
echo ""
echo "🎯 Next steps:"
echo "  1. Update git user info in git_config with your details"
echo "  2. Restart your terminal or run 'source ~/.zshrc'"
echo "  3. Review installed applications and system settings"
echo ""
echo "💡 Tip: Run './scripts/update.sh' periodically to keep everything up to date"