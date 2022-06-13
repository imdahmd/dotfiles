export BASH_SILENCE_DEPRECATION_WARNING=1
export PS1="\W $ "
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx # LSCOLORS for black background shell

if which jenv > /dev/null; then eval "$(jenv init -)"; fi
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

if [ -d $HOME/Projects/golang ]; then
    export GOPATH="$HOME/Projects/golang"
    export GOBIN="$GOPATH/bin"
fi

if [ -d $HOME/.nvm ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

if [ -d /opt/homebrew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export PATH="/usr/local/sbin:$PATH"
