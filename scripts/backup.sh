#!/usr/bin/env bash
# Backup current dotfiles before updating

set -e

BACKUP_DIR="$HOME/dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

echo "🗂️  Creating backup of current dotfiles..."
mkdir -p "$BACKUP_DIR"

# Backup current files
files_to_backup=(
    "$HOME/.gitconfig"
    "$HOME/.gitignore_global"
    "$HOME/.zshrc"
    "$HOME/.zshenv"
    "$HOME/.ssh/config"
    "$HOME/.azure/config"
    "$HOME/.terraformrc"
    "$HOME/.tflint.hcl"
    "$HOME/.terraform.d/global.tfvars"
)

for file in "${files_to_backup[@]}"; do
    if [ -e "$file" ]; then
        echo "📦 Backing up $file"
        cp "$file" "$BACKUP_DIR/" 2>/dev/null || true
    fi
done

# Backup VS Code settings (if they exist)
if [ -d "$HOME/Library/Application Support/Code/User" ]; then
    echo "📦 Backing up VS Code settings..."
    mkdir -p "$BACKUP_DIR/vscode"
    cp "$HOME/Library/Application Support/Code/User/settings.json" "$BACKUP_DIR/vscode/" 2>/dev/null || true
    cp "$HOME/Library/Application Support/Code/User/keybindings.json" "$BACKUP_DIR/vscode/" 2>/dev/null || true
fi

echo "✅ Backup created at: $BACKUP_DIR"
echo ""
echo "🔄 You can now safely run './install.sh' to update your dotfiles"