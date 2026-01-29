#!/bin/bash
set -e

echo "� Dotfiles Setup Script"
echo "========================="
echo ""

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Install Homebrew if not present
if ! command -v brew &> /dev/null; then
    echo "🍺 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for Apple Silicon Macs
    echo "🔧 Adding Homebrew to PATH..."
    if [[ $(uname -m) == "arm64" ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        echo 'eval "$(/usr/local/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/usr/local/bin/brew shellenv)"
    fi
    echo "✅ Homebrew installed!"
else
    echo "✅ Homebrew already installed"
fi

# Install essential tools
echo ""
echo "📦 Installing essential tools..."

# Add HashiCorp tap for official Terraform
if ! brew tap | grep -q hashicorp/tap; then
    echo "🔧 Adding HashiCorp tap..."
    brew tap hashicorp/tap
fi

# Install tools
tools=(
    "azure-cli"
    "hashicorp/tap/terraform"
    "1password-cli"
)

for tool in "${tools[@]}"; do
    if ! brew list "$tool" &> /dev/null; then
        echo "📦 Installing $tool..."
        brew install "$tool"
    else
        echo "✅ $tool already installed"
    fi
done

echo ""
echo "🔗 Linking dotfiles..."

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
echo "🎉 Setup complete!"
echo ""
echo "📝 Next steps:"
echo "  • Restart your terminal or run: source ~/.zshrc"
echo "  • Login to Azure: az login"
echo "  • Verify Terraform: terraform --version"
echo "  • Login to 1Password CLI: op signin"
echo "  • Verify Azure config: az config list"
echo "  • Verify Git config: git config --list"