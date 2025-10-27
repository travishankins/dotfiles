# Dotfiles

Personal configuration files for development environment setup on macOS.

## � Repository Structure

```
dotfiles/
├── git/                    # Git & SSH configuration
│   ├── git_config         # Git user, aliases, and settings
│   ├── gitignore_global   # Global gitignore patterns
│   └── ssh_config         # SSH config (1Password agent)
│
├── shell/                  # Shell configuration
│   ├── zshrc              # Zsh configuration with Oh My Zsh
│   ├── zshenv             # Environment variables
│   └── aliases.zsh        # Custom shell aliases
│
├── config/                 # Cloud & infrastructure tools
│   ├── azure-config       # Azure CLI configuration
│   ├── terraformrc        # Terraform configuration
│   ├── tflint.hcl         # TFLint configuration
│   └── global.tfvars      # Terraform global variables
│
├── scripts/                # Installation & maintenance scripts
│   ├── install-homebrew.sh
│   ├── install-apps.sh
│   ├── link-dotfiles.sh   # Symlink all configs
│   ├── macos-defaults.sh
│   ├── update.sh
│   └── backup.sh
│
├── dracula-theme/          # Oh My Zsh theme (symlinked)
├── Brewfile                # Homebrew packages & apps
├── install.sh              # Main setup script
└── README.md
```

## �📋 Contents

### Git Configuration (`git/`)
- **git_config** - Git configuration with useful aliases and settings
- **gitignore_global** - Global gitignore patterns for various platforms and tools
- **ssh_config** - SSH configuration with 1Password agent integration

### Shell Configuration (`shell/`)
- **zshrc** - Zsh shell configuration with Oh My Zsh setup
- **zshenv** - Environment variables (PATH, exports, etc.)
- **aliases.zsh** - Custom shell aliases for Git, Terraform, Azure, Docker, etc.

### Cloud & Infrastructure Configuration (`config/`)
- **azure-config** - Azure CLI configuration
- **terraformrc** - Terraform CLI configuration with plugin caching
- **tflint.hcl** - TFLint configuration
- **global.tfvars** - Global Terraform variables

### VSCode Configuration
- **vscode/settings.json** - VSCode editor settings
- **vscode/extensions.json** - Recommended VSCode extensions

### Installation Scripts
- **install.sh** - Main installation script that sets up all dotfiles with safe backups
- **scripts/install-homebrew.sh** - Installs Homebrew package manager
- **scripts/install-apps.sh** - Installs applications from Brewfile
- **scripts/link-dotfiles.sh** - Links all dotfiles to home directory (can be run standalone)
- **scripts/macos-defaults.sh** - Configures macOS system preferences
- **scripts/update.sh** - Updates Homebrew, Oh My Zsh, and other tools
- **scripts/backup.sh** - Backs up current configurations
- **Brewfile** - Homebrew package definitions (CLI tools and applications)

## 🚀 Quick Start (Fresh Mac Setup)

### One-Command Setup (Recommended)

```bash
# Clone this repository
mkdir -p ~/Developer
git clone https://github.com/travishankins/dotfiles.git ~/Developer/dotfiles
cd ~/Developer/dotfiles

# Run the main installation script (does everything!)
./install.sh
```

The main `install.sh` script will:
1. ✅ Install Xcode Command Line Tools
2. ✅ Install Homebrew
3. ✅ Install all applications from Brewfile
4. ✅ Install Oh My Zsh and plugins
5. ✅ Create symbolic links for all dotfiles (including aliases)
6. ✅ Configure macOS system defaults

After installation, restart your terminal or run `source ~/.zshrc`.

### Manual Step-by-Step Setup

If you prefer to run each step individually:

#### 1. Clone this repository
```bash
mkdir -p ~/Developer
git clone https://github.com/travishankins/dotfiles.git ~/Developer/dotfiles
cd ~/Developer/dotfiles
```

#### 2. Install Xcode Command Line Tools
```bash
xcode-select --install
```

#### 3. Install Homebrew
```bash
./scripts/install-homebrew.sh
```

#### 4. Install Applications
Edit `Brewfile` to customize your applications, then run:
```bash
./scripts/install-apps.sh
```

#### 5. Link Dotfiles (creates all symlinks)
```bash
./scripts/link-dotfiles.sh
```

This will symlink:
- Git configuration (git/git_config → ~/.gitconfig)
- Global gitignore (git/gitignore_global → ~/.gitignore_global)
- SSH config (git/ssh_config → ~/.ssh/config)
- Zsh configuration (shell/zshrc → ~/.zshrc, shell/zshenv → ~/.zshenv)
- Custom aliases (shell/aliases.zsh, sourced by zshrc)
- Azure CLI config (config/azure-config → ~/.azure/config)
- Terraform configs (config/terraformrc, config/tflint.hcl, etc.)
- Oh My Zsh Dracula theme (via symlink)

#### 6. Configure macOS Settings (Optional)
```bash
./scripts/macos-defaults.sh
```

#### 7. Restart Terminal
Close and reopen your terminal or run:
```bash
source ~/.zshrc
```

## � Re-linking Dotfiles

If you update any dotfiles or need to re-apply symlinks, you can run the linking script independently:

```bash
cd ~/Developer/dotfiles
./scripts/link-dotfiles.sh
```

This is useful when:
- You've updated dotfiles and want to ensure symlinks are current
- You've manually removed symlinks and want to restore them
- Setting up on a new machine where you already have Homebrew/apps installed

## �📦 What Gets Installed

### Homebrew Packages (CLI Tools)
- **azure-cli** - Azure command-line interface
- **gh** - GitHub CLI
- **git** - Version control
- **terraform** - Infrastructure as Code
- **tflint** - Terraform linter
- **wget** - Download utility
- **jq** - JSON processor
- **yq** - YAML processor

### Applications (Casks)
- **OrbStack** - Docker Desktop alternative
- **PowerShell** - PowerShell for macOS
- **Visual Studio Code** - Code editor
- **1Password** - Password manager



## 🔧 Customization

### Update Git User Information
Edit `git/git_config` and update with your details:
```ini
[user]
    name = Your Name
    email = your.email@example.com
```

### Add More Applications
Edit `Brewfile` and add your preferred applications:
```ruby
brew "package-name"          # For CLI tools
cask "application-name"      # For GUI applications
```

Then run:
```bash
brew bundle --file=~/Developer/dotfiles/Brewfile
```

### Add Custom Aliases
Edit `shell/aliases.zsh` to add your own shell aliases.

### Update Environment Variables
Edit `shell/zshenv` to add custom PATH entries or environment variables.

## 📁 Backup & Recovery

### Already Backed Up in This Repository ✅
- [x] Git configuration (`git/git_config`)
- [x] Global gitignore (`git/gitignore_global`)
- [x] SSH config (`git/ssh_config`)
- [x] Zsh configuration (`shell/zshrc`, `shell/zshenv`)
- [x] Shell aliases (`shell/aliases.zsh`)
- [x] VSCode settings and extensions
- [x] Azure CLI config (`config/azure-config`)
- [x] Terraform config (`config/terraformrc`, `config/tflint.hcl`, `config/global.tfvars`)
- [x] Homebrew package list (`Brewfile`)

### Manual Backups Needed 📋

**Security & Credentials** (Store in 1Password)
- [ ] SSH private keys (`~/.ssh/id_*`)
- [ ] GPG keys (`~/.gnupg/`) - Export: `gpg --export-secret-keys > gpg-backup.asc`
- [ ] GitHub Personal Access Tokens
- [ ] Azure Service Principal credentials
- [ ] Cloud provider API keys

**Development Tools**
- [ ] AWS credentials/config (`~/.aws/`)
- [ ] GCP credentials (`~/.config/gcloud/`)
- [ ] Kubernetes config (`~/.kube/config`)
- [ ] Docker config (`~/.docker/config.json`)
- [ ] npm/Python/Ruby configs (`~/.npmrc`, `~/.pypirc`, `~/.gemrc`)

**Application Configs**
- [ ] Database client configs (`~/.psqlrc`, `~/.my.cnf`)
- [ ] Vim/Tmux configs (`~/.vimrc`, `~/.tmux.conf`)
- [ ] VS Code snippets (`~/Library/Application Support/Code/User/snippets/`)
- [ ] Other configs in `~/.config/` (gh, etc.)

**Browser & Desktop**
- [ ] Browser bookmarks (export to file)
- [ ] Browser extensions list
- [ ] Desktop & important folders

### Cloud-Synced (No Backup Needed) ☁️
- iCloud Documents, Photos, etc.
- 1Password vault (cloud-synced)
- Git repositories (on GitHub/remote)
- Email, Calendar, Contacts (IMAP/iCloud)
- OrbStack containers (can be rebuilt)
- Terraform state (should be in remote backend)
- Oh My Zsh plugins (auto-installed by script)

### New Mac Setup Order 🚀
1. Sign in to iCloud
2. Install Xcode Command Line Tools: `xcode-select --install`
3. Install 1Password (for credentials)
4. Clone dotfiles: `git clone https://github.com/travishankins/dotfiles.git ~/Developer/dotfiles`
5. Run `./scripts/install-homebrew.sh`
6. Run `./scripts/install-apps.sh`
7. Run `./install.sh`
8. Run `./scripts/macos-defaults.sh` (optional)
9. Configure System Preferences
10. Restore any additional configs as needed

## 🔄 Updating Dotfiles

To keep your dotfiles and tools up to date, run the update script:

```bash
cd ~/Developer/dotfiles
./scripts/update.sh
```

This will:
- Pull latest dotfiles from Git
- Update Homebrew packages
- Update Oh My Zsh and plugins
- Re-link dotfiles
- Refresh terminal configuration

### Manual Update Steps

#### Pull Latest Changes Only
```bash
cd ~/Developer/dotfiles
git pull
```

#### Re-run Installation
```bash
./install.sh
source ~/.zshrc
```

#### Update Brewfile with Current Packages
To save your currently installed packages to the Brewfile:
```bash
brew bundle dump --force --file=~/Developer/dotfiles/Brewfile
```

## 💡 Useful Commands

### Reload Shell Configuration
```bash
reload              # Alias for: source ~/.zshrc
```

### Update All Homebrew Packages
```bash
brewup              # Alias for: brew update && brew upgrade && brew cleanup
```

### View All Aliases
```bash
alias               # Shows all active aliases
```

### Edit Configuration Files
```bash
zshconfig           # Opens ~/.zshrc in VSCode
aliases             # Opens aliases.zsh in VSCode
```

## 🛠 Troubleshooting

### Symlinks Not Working
If symlinks aren't created properly, ensure the dotfiles directory is at `~/Developer/dotfiles`:
```bash
ls -la ~/ | grep gitconfig
# Should show: .gitconfig -> /Users/[your-username]/Developer/dotfiles/git_config
```

### VSCode Settings Not Applied
Check if VSCode settings are symlinked:
```bash
ls -la ~/Library/Application\ Support/Code/User/
```

If not, re-run:
```bash
./install.sh
```

### Homebrew Not Found After Installation
For Apple Silicon Macs, add to your shell:
```bash
eval "$(/opt/homebrew/bin/brew shellenv)"
```

## 📚 Resources

- [Homebrew Documentation](https://docs.brew.sh/)
- [Oh My Zsh](https://ohmyz.sh/)
- [Dracula Theme](https://draculatheme.com/)
- [1Password SSH Agent](https://developer.1password.com/docs/ssh/)

## 📄 License

MIT License - Feel free to use and modify for your own needs.

## 🤝 Contributing

This is a personal dotfiles repository, but feel free to fork and adapt for your own use!
