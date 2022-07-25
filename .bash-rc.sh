export BASH_SILENCE_DEPRECATION_WARNING=1
export PS1="\W $ "
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx # LSCOLORS for black background shell

if [ -d /opt/homebrew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [ -d $HOMEBREW_PREFIX/opt/openjdk ]; then
    if ! [ -L /Library/Java/JavaVirtualMachines/openjdk.jdk ]; then
        echo "Requesting sudo to add a symlink to openjdk for system Java wrappers to find it"
        sudo ln -sfn $HOMEBREW_PREFIX/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
    fi

    if which jenv > /dev/null; then
        jenv add $HOMEBREW_PREFIX/opt/openjdk > /dev/null
        eval "$(jenv init -)"
        jenv global $(java --version | head -1 | awk '{print $2}')
        export JAVA_HOME="$(jenv javahome)"
    fi
fi

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

export PATH="/usr/local/sbin:$PATH"
