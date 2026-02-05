# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# ==================== ZSH Configuration ====================
# History settings
HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.zsh_history
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits
setopt SHARE_HISTORY             # Share history between all sessions
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry

# Completion settings
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'  # Case insensitive completion
setopt COMPLETE_IN_WORD          # Complete from both ends of a word
setopt ALWAYS_TO_END             # Move cursor to the end of a completed word

# Directory navigation
setopt AUTO_CD                   # Auto cd when typing directory name
setopt AUTO_PUSHD                # Push the old directory onto the stack on cd
setopt PUSHD_IGNORE_DUPS         # Do not store duplicates in the stack
setopt PUSHD_SILENT              # Do not print the directory stack after pushd or popd

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
