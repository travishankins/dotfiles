# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Syntax highlighting (colors commands as you type)
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Autosuggestions (suggests commands as you type - press → to accept)
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Starship prompt (beautiful, fast prompt)
eval "$(starship init zsh)"

# ==================== Navigation ====================
alias ll='ls -lah'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias dev='cd ~/Developer'
alias doc='cd ~/Documents'

# ==================== Azure & Terraform ====================
alias azlogin='az login'
alias tf='terraform'
alias tfi='terraform init'
alias tfp='terraform plan'
alias tfa='terraform apply'
alias tfd='terraform destroy'

# ==================== Network ====================
alias myip="curl -s https://api.ipify.org && echo"
alias localip="ipconfig getifaddr en0"

# ==================== System ====================
alias showfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidefiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash"

# ==================== Homebrew ====================
alias brewup="brew update && brew upgrade && brew cleanup"
alias brewdump="brew bundle dump --force --file=~/Developer/dotfiles/Brewfile"
