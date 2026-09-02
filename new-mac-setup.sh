#!/usr/bin/env bash
set -euo pipefail

### 1. Change default shell to bash
# macOS defaults to zsh; switch to the system bash now so we have a known,
# consistent shell while bootstrapping. We'll switch again to Homebrew's
# newer bash once it's installed (step 3).
if [ "$SHELL" != "/bin/bash" ]; then
    chsh -s /bin/bash
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

### 3. Install latest bash via Homebrew and make it the default shell
brew install bash
BREW_BASH="$(brew --prefix)/bin/bash"
if ! grep -qx "$BREW_BASH" /etc/shells; then
    echo "$BREW_BASH" | sudo tee -a /etc/shells
fi
if [ "$SHELL" != "$BREW_BASH" ]; then
    chsh -s "$BREW_BASH"
fi

### 4. Install iTerm2
brew install --cask iterm2

### Generate new SSH key and add to ssh-agent
# ssh-keygen -t ed25519 -C "imdad.ahmed@gmail.com"
# eval "$(ssh-agent -s)"
# touch ~/.ssh/config
# cat <<EOF >> ~/.ssh/config
# Host *
#   AddKeysToAgent yes
#   IdentityFile ~/.ssh/id_ed25519
# EOF
# ssh-add -K ~/.ssh/id_ed25519
# pbcopy < ~/.ssh/id_ed25519.pub && echo "SSH public key copied to clipboard"

### Get .dot-files from github.com/imdahmd
# git init .
# git remote add origin git@github.com:imdahmd/dotfiles.git
# git pull origin master
# echo "At this point run package-install-selected-packages on emacs to install all packages"

### Install jenv
# jenv add /usr/local/Cellar/openjdk/17/
# jenv global 17

### Install babashka
bash < <(curl -s https://raw.githubusercontent.com/babashka/babashka/master/install)
