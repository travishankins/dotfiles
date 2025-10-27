#!/usr/bin/env bash
# macOS System Preferences Setup
# Run this script to configure macOS system settings
# Some settings require logout/restart to take effect

set -e

echo "🍎 macOS System Defaults Configuration"
echo "======================================"
echo ""
echo "This will configure various macOS system settings."
echo "Some changes may require a logout or restart to take effect."
echo ""
read -p "Do you want to proceed? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Configuration cancelled."
    exit 0
fi

echo "⚙️  Configuring macOS settings..."
echo ""

# Close System Preferences to prevent overriding settings
osascript -e 'tell application "System Preferences" to quit'

###############################################################################
# General UI/UX                                                               #
###############################################################################

echo "🎨 Configuring UI/UX settings..."

# Set computer name (as done via System Preferences → Sharing)
# sudo scutil --set ComputerName "MacBookPro"
# sudo scutil --set HostName "MacBookPro"
# sudo scutil --set LocalHostName "MacBookPro"
# sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "MacBookPro"


# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Disable automatic capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories                           #
###############################################################################

echo "⌨️  Configuring input devices..."

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

###############################################################################
# Finder                                                                      #
###############################################################################

echo "📁 Configuring Finder..."

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Show the ~/Library folder
chflags nohidden ~/Library


###############################################################################
# Dock                                                                        #
###############################################################################

echo "🎯 Configuring Dock..."

# Set the icon size of Dock items
defaults write com.apple.dock tilesize -int 48

# Position the Dock on the bottom
defaults write com.apple.dock orientation -string "bottom"

# Minimize windows into their application's icon
defaults write com.apple.dock minimize-to-application -bool true

# Show indicator lights for open applications
defaults write com.apple.dock show-process-indicators -bool true

# Don't animate opening applications
defaults write com.apple.dock launchanim -bool false

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool false

# Don't show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

###############################################################################
# Safari & WebKit                                                             #
###############################################################################

echo "🌐 Configuring Safari..."

# Privacy: don't send search queries to Apple

# Show the full URL in the address bar
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool false


###############################################################################
# Terminal                                                                    #
###############################################################################

echo "💻 Configuring Terminal..."

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# Enable Secure Keyboard Entry in Terminal.app
defaults write com.apple.terminal SecureKeyboardEntry -bool true

# Download and install Dracula Terminal theme
echo "🧛 Installing Dracula Terminal theme..."

# Check if Fira Code font is installed
if ! system_profiler SPFontsDataType | grep -q "Fira Code"; then
    echo "⚠️  Fira Code font not found. Run './scripts/install-apps.sh' first to install fonts."
fi

if [ ! -f "/tmp/Dracula.terminal" ]; then
    curl -L https://raw.githubusercontent.com/dracula/terminal-app/master/Dracula.terminal -o /tmp/Dracula.terminal
fi

# Install the theme
open /tmp/Dracula.terminal

# Wait a moment for the theme to be imported
sleep 2

# Set Dracula as default theme
defaults write com.apple.terminal "Default Window Settings" -string "Dracula"
defaults write com.apple.terminal "Startup Window Settings" -string "Dracula"

# Set Fira Code font (if the theme supports it, otherwise will need manual adjustment)
echo "⚠️  Note: Please manually set font to 'Fira Code 14pt' in Terminal > Preferences > Profiles > Dracula > Text"

###############################################################################
# Activity Monitor                                                            #
###############################################################################

echo "📊 Configuring Activity Monitor..."

# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

###############################################################################
# Done                                                                        #
###############################################################################

echo ""
echo "✅ macOS configuration complete!"
echo ""
echo "🔄 Some changes require a restart. Please logout or restart your Mac."
echo ""
echo "To restart Finder, Dock, and other services now, run:"
echo "  killall Finder Dock SystemUIServer"
