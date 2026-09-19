#!/usr/bin/env bash
set -euo pipefail

### 1. Change default shell to bash
# macOS defaults to zsh; switch to the system bash now so we have a known,
# consistent shell while bootstrapping. We'll switch again to Homebrew's
# newer bash once it's installed (step 3).
if [ "$SHELL" != "/bin/bash" ]; then
    chsh -s /bin/bash || echo "NOTE: run 'chsh -s /bin/bash' yourself (needs an interactive terminal)." >&2
fi

### 2. Install Homebrew
if ! command -v brew >/dev/null 2>&1; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Make brew available in this script's current session
if [ -d /opt/homebrew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -d /usr/local/Homebrew ]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi

### 3. Get dotfiles from github.com/imdahmd (bare-repo technique)
# The repo's git-dir lives outside $HOME so a plain `git` command anywhere
# under $HOME never picks it up by accident; use the `dotfiles` alias
# (defined in .aliases-rc.sh) for all dotfiles git operations from now on.
DOTFILES_GIT_DIR="$HOME/.dotfiles.git"
dotfiles() { git --git-dir="$DOTFILES_GIT_DIR" --work-tree="$HOME" "$@"; }

if [ ! -d "$DOTFILES_GIT_DIR" ]; then
    git clone --bare https://github.com/imdahmd/dotfiles.git "$DOTFILES_GIT_DIR"

    # Back up anything a fresh macOS account already has in place that would
    # otherwise be clobbered by checkout (e.g. a default .bash_profile).
    BACKUP_DIR="$HOME/.dotfiles-backup"
    CONFLICTS=$(dotfiles checkout 2>&1 | grep -E "^\s+\." | awk '{print $1}') || true
    if [ -n "$CONFLICTS" ]; then
        mkdir -p "$BACKUP_DIR"
        echo "$CONFLICTS" | while read -r FILE; do
            mkdir -p "$BACKUP_DIR/$(dirname "$FILE")"
            mv "$HOME/$FILE" "$BACKUP_DIR/$FILE"
        done
        dotfiles checkout
    fi
    echo "At this point run package-install-selected-packages on emacs to install all packages"
else
    # Already cloned from a prior run of this script — just pull latest.
    dotfiles pull
fi

# Local-only exclude list (never committed itself) — see $GIT_DIR/info/exclude.
# Source of truth is the tracked .dotfiles-exclude. Refreshed on every run so
# a pulled update to the list takes effect. Deliberately NOT setting
# status.showUntrackedFiles=no: this list already covers everything else in
# $HOME, so anything still surfacing as untracked is genuinely new and worth
# a look, not noise.
cp "$HOME/.dotfiles-exclude" "$DOTFILES_GIT_DIR/info/exclude"

### 4. Install latest bash via Homebrew and make it the default shell
brew install bash
BREW_BASH="$(brew --prefix)/bin/bash"
if ! grep -qx "$BREW_BASH" /etc/shells; then
    echo "$BREW_BASH" | sudo tee -a /etc/shells
fi
if [ "$SHELL" != "$BREW_BASH" ]; then
    chsh -s "$BREW_BASH" || echo "NOTE: run 'chsh -s $BREW_BASH' yourself (needs an interactive terminal)." >&2
fi

### 5. Install iTerm2 and set Option-key-as-Esc+ (for Emacs meta-key bindings)
brew install --cask iterm2

# Launch once so its default profile exists to configure. Bundle path, not
# name — Launch Services may not have indexed a just-installed cask yet.
open -a "/Applications/iTerm.app"
sleep 3

ITERM_PLIST="$HOME/Library/Preferences/com.googlecode.iterm2.plist"
pb() { /usr/libexec/PlistBuddy -c "$1" "$ITERM_PLIST"; }
pb "Set :New\ Bookmarks:0:Option\ Key\ Sends 2" 2>/dev/null || pb "Add :New\ Bookmarks:0:Option\ Key\ Sends integer 2"
pb "Set :New\ Bookmarks:0:Right\ Option\ Key\ Sends 2" 2>/dev/null || pb "Add :New\ Bookmarks:0:Right\ Option\ Key\ Sends integer 2"
killall cfprefsd 2>/dev/null || true

### 6. Install must-have tools: Chrome and Emacs
brew install --cask google-chrome
brew install --cask emacs-app
# At this point run package-install-selected-packages on emacs to install all packages.
# If the Tomorrow night theme doesn't load automatically, run: M-x color-theme-sanityinc-tomorrow-day

### 7. Configure Dock: small, left-aligned, auto-hidden
defaults write com.apple.dock tilesize -int 36
defaults write com.apple.dock orientation -string left
defaults write com.apple.dock autohide -bool true
killall Dock

### 8. Remap Caps Lock to Control (applies to any keyboard; persists across
### reboots/logins via a LaunchAgent, since `hidutil` itself is per-session)
mkdir -p "$HOME/Library/LaunchAgents"
cp "$HOME/.launchd/com.imdahmd.capslock-to-control.plist" "$HOME/Library/LaunchAgents/"
launchctl load "$HOME/Library/LaunchAgents/com.imdahmd.capslock-to-control.plist"

