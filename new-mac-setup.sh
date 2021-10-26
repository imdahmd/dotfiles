### Change shell to bash
# chsh -s /bin/bash

### Install brew
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

### Install emacs and git
# brew install --cask emacs
# brew install git

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

### Use iterm from this point on
# brew install --cask iterm2

### Install zoom
# brew install --cask zoom

### Install slack
# brew install --cask slack

### Install scheme
# brew install mit-scheme

### Install signal
# brew install --cask signal

### Install google drive
# brew install --cask google-drive

### Install openjdk
# brew install openjdk@17

### Install jenv
# brew install jenv
# jenv add /usr/local/Cellar/openjdk/17/
# jenv global 17

### Install clojure
# brew install clojure
