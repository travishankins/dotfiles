# Dotfiles

My personal macOS configuration files.

## Contents

- `.zshrc` - Zsh shell configuration with aliases and plugins

## Setup

To restore on a new machine:

```bash
# Copy .zshrc
cp .zshrc ~/.zshrc

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install plugins
brew install zsh-syntax-highlighting zsh-autosuggestions starship

# Reload shell
source ~/.zshrc
```

## Backup

```bash
# Update .zshrc backup
cp ~/.zshrc ~/Developer/dotfiles/.zshrc
cd ~/Developer/dotfiles
git add .zshrc
git commit -m "Update .zshrc"
```
