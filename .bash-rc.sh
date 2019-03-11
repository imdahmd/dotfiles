export PS1="\W $ "
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx # LSCOLORS for black background shell

if which jenv > /dev/null; then eval "$(jenv init -)"; fi
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

if [ -d $HOME/Projects/golang ]; then
    export GOPATH="$HOME/Projects/golang"
    export GOBIN="$GOPATH/bin"
fi

