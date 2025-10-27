#!/usr/bin/env bash
set -e

DOTFILES_DIR="$HOME/Developer/dotfiles"

echo "🔗 Dotfiles Linking Script"
echo "============================"
echo ""

# Backup existing files if they exist and aren't already symlinks
backup_if_exists() {
    local file="$1"
    if [ -e "$file" ] && [ ! -L "$file" ]; then
        echo "📦 Backing up existing $file to ${file}.backup"
        mv "$file" "${file}.backup"
    fi
}

# Remove existing symlinks
remove_symlink() {
    local file="$1"
    if [ -L "$file" ]; then
        echo "🗑️  Removing existing symlink: $file"
        rm "$file"
    fi
}

echo "🔧 Setting up Git configuration..."
backup_if_exists ~/.gitconfig
backup_if_exists ~/.gitignore_global
remove_symlink ~/.gitconfig
remove_symlink ~/.gitignore_global
ln -sf "$DOTFILES_DIR/git/git_config" ~/.gitconfig
ln -sf "$DOTFILES_DIR/git/gitignore_global" ~/.gitignore_global
echo "✅ Git configuration linked"
echo ""

echo "🔐 Setting up SSH configuration..."
mkdir -p ~/.ssh
backup_if_exists ~/.ssh/config
remove_symlink ~/.ssh/config
ln -sf "$DOTFILES_DIR/git/ssh_config" ~/.ssh/config
echo "✅ SSH configuration linked"
echo ""

echo "🐚 Setting up Shell configuration..."
backup_if_exists ~/.zshrc
backup_if_exists ~/.zshenv
remove_symlink ~/.zshrc
remove_symlink ~/.zshenv
ln -sf "$DOTFILES_DIR/shell/zshrc" ~/.zshrc
ln -sf "$DOTFILES_DIR/shell/zshenv" ~/.zshenv
echo "✅ Shell configuration linked"
echo "✅ Aliases will be loaded from shell/aliases.zsh (sourced in zshrc)"
echo ""

echo "☁️  Setting up Azure CLI configuration..."
mkdir -p ~/.azure
backup_if_exists ~/.azure/config
remove_symlink ~/.azure/config
ln -sf "$DOTFILES_DIR/config/azure-config" ~/.azure/config
echo "✅ Azure CLI configuration linked"
echo ""

echo "🏗️  Setting up Terraform configuration..."
backup_if_exists ~/.terraformrc
backup_if_exists ~/.tflint.hcl
backup_if_exists ~/.terraform.d/global.tfvars
remove_symlink ~/.terraformrc
remove_symlink ~/.tflint.hcl
remove_symlink ~/.terraform.d/global.tfvars
mkdir -p ~/.terraform.d/plugin-cache
mkdir -p ~/.terraform.d
ln -sf "$DOTFILES_DIR/config/terraformrc" ~/.terraformrc
ln -sf "$DOTFILES_DIR/config/tflint.hcl" ~/.tflint.hcl
ln -sf "$DOTFILES_DIR/config/global.tfvars" ~/.terraform.d/global.tfvars
echo "✅ Terraform configuration linked"
echo ""

echo "🧛 Setting up Oh My Zsh theme..."
# Install Dracula theme for Oh My Zsh
if [ ! -d "$DOTFILES_DIR/dracula-theme" ]; then
    echo "📦 Cloning Dracula theme to dotfiles..."
    git clone https://github.com/dracula/zsh.git "$DOTFILES_DIR/dracula-theme"
fi

DRACULA_THEME_LINK="$HOME/.oh-my-zsh/custom/themes/dracula.zsh-theme"
if [ ! -L "$DRACULA_THEME_LINK" ]; then
    echo "🔗 Linking Dracula theme..."
    mkdir -p "$HOME/.oh-my-zsh/custom/themes"
    ln -sf "$DOTFILES_DIR/dracula-theme/dracula.zsh-theme" "$DRACULA_THEME_LINK"
    echo "✅ Dracula theme linked"
else
    echo "✅ Dracula theme already linked"
fi
echo ""

echo "================================"
echo "✅ All dotfiles linked successfully!"
echo "================================"
echo ""
echo "📋 Linked configurations:"
echo "  • Git config & global gitignore"
echo "  • SSH config"
echo "  • Zsh config & environment"
echo "  • Custom aliases (via aliases.zsh)"
echo "  • Azure CLI config"
echo "  • Terraform configs"
echo "  • Oh My Zsh Dracula theme"
echo ""
echo "💡 Tip: Run 'source ~/.zshrc' to reload your shell configuration"
echo ""
