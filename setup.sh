#!/bin/bash
set -e

echo "🔗 Linking dotfiles..."

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Function to create backup if file exists and is not a symlink
backup_if_exists() {
    local file="$1"
    if [ -e "$file" ] && [ ! -L "$file" ]; then
        echo "📦 Backing up existing $file to ${file}.backup"
        mv "$file" "${file}.backup"
    fi
}

# Function to safely create symlink
safe_symlink() {
    local source="$1"
    local target="$2"
    local target_dir=$(dirname "$target")
    
    # Create target directory if it doesn't exist
    mkdir -p "$target_dir"
    
    # Backup existing file if needed
    backup_if_exists "$target"
    
    # Remove existing symlink if it exists
    [ -L "$target" ] && rm "$target"
    
    # Create symlink
    ln -sf "$source" "$target"
    echo "✅ Linked $source → $target"
}

# Link Git configuration
safe_symlink "$DOTFILES_DIR/git/git_config" "$HOME/.gitconfig"
safe_symlink "$DOTFILES_DIR/git/gitignore_global" "$HOME/.gitignore_global"
safe_symlink "$DOTFILES_DIR/git/ssh_config" "$HOME/.ssh/config"

# Link shell configuration
safe_symlink "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

# Link Azure configuration
safe_symlink "$DOTFILES_DIR/azure-config" "$HOME/.azure/config"

echo ""
echo "🎉 All dotfiles linked successfully!"
echo ""
echo "📝 Next steps:"
echo "  • Restart your terminal or run: source ~/.zshrc"
echo "  • Verify Azure config: az config list"
echo "  • Verify Git config: git config --list"