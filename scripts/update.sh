#!/usr/bin/env bash
# Update dotfiles and all tools

set -e

cd ~/Developer/dotfiles

echo ""
echo "🍺 Updating Homebrew packages..."
brew update
brew upgrade
brew bundle --file=./Brewfile
brew cleanup

echo ""
echo "🔧 Updating Oh My Zsh..."
"$ZSH/tools/upgrade.sh" || true

echo ""
echo "🧛 Updating Dracula themes..."
# Update Oh My Zsh Dracula theme
if [ -d "$HOME/.oh-my-zsh/themes" ]; then
    curl -L https://raw.githubusercontent.com/dracula/zsh/master/dracula.zsh-theme \
         -o "$HOME/.oh-my-zsh/themes/dracula.zsh-theme"
fi

echo ""
echo "🔗 Re-linking dotfiles..."
./install.sh

echo ""
echo "✅ Update complete!"
echo "🔄 Restart your terminal or run 'source ~/.zshrc' to apply changes"