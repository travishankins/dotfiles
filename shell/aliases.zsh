# Custom Shell Aliases
# This file is sourced from .zshrc

# ==================== Navigation ====================
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~"
alias dev="cd ~/Developer"
alias proj="cd ~/Developer/projects"

# ==================== List Commands ====================
alias l="ls -lh"
alias la="ls -lAh"
alias ll="ls -lh"
alias lsa="ls -lAh"

# ==================== Git Shortcuts ====================
alias g="git"
alias gs="git status -sb"
alias ga="git add"
alias gaa="git add --all"
alias gc="git commit -m"
alias gca="git commit --amend --no-edit"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gb="git branch"
alias gbd="git branch -d"
alias gp="git push"
alias gpl="git pull --rebase"
alias gf="git fetch"
alias gl="git log --oneline --graph --decorate --all -10"
alias gd="git diff"
alias gds="git diff --staged"
alias gclean="git clean -fd"
alias greset="git reset --hard HEAD"
alias gstash="git stash"
alias gpop="git stash pop"

# ==================== Terraform ====================
alias tf="terraform"
alias tfi="terraform init"
alias tfp="terraform plan"
alias tfa="terraform apply"
alias tfd="terraform destroy"
alias tfv="terraform validate"
alias tff="terraform fmt -recursive"
alias tfw="terraform workspace"
alias tfws="terraform workspace select"
alias tfwl="terraform workspace list"

# Terraform with global vars
alias tfpg="terraform plan -var-file=\"~/.terraform.d/global.tfvars\""
alias tfag="terraform apply -var-file=\"~/.terraform.d/global.tfvars\""

# TFLint
alias tfl="tflint"
alias tfla="tflint --init && tflint"

# Terraform state management
alias tfs="terraform state"
alias tfsl="terraform state list"
alias tfss="terraform state show"

# Quick cleanup
alias tfclean="rm -rf .terraform .terraform.lock.hcl terraform.tfstate terraform.tfstate.backup"

# ==================== Azure CLI ====================
alias azl="az login"
alias azls="az account list -o table"
alias azset="az account set --subscription"
alias azshow="az account show"
alias azrg="az group list -o table"
alias azres="az resource list -o table"
alias azloc="az account list-locations -o table"

# ==================== Docker/OrbStack ====================
alias d="docker"
alias dc="docker compose"
alias dps="docker ps"
alias dpsa="docker ps -a"
alias di="docker images"
alias drm="docker rm"
alias drmi="docker rmi"
alias dstop="docker stop"
alias dstart="docker start"
alias dlogs="docker logs"
alias dexec="docker exec -it"

# ==================== VSCode ====================
alias c="code"
alias c.="code ."

# ==================== Utilities ====================
alias reload="source ~/.zshrc"
alias zshconfig="code ~/.zshrc"
alias aliases="code ~/Developer/dotfiles/aliases.zsh"
alias hosts="sudo code /etc/hosts"
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
alias path='echo -e ${PATH//:/\\n}'

# Modern CLI tools (if installed)
alias ls="exa --icons"
alias ll="exa -la --icons --git"
alias lt="exa --tree --icons"
alias cat="bat"
alias find="fd"
alias cd="z"  # zoxide
alias grep="rg"

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
