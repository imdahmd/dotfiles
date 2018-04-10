[[ -s "$HOME/.aliases-rc.sh" ]] && source "$HOME/.aliases-rc.sh"
[[ -s "$HOME/.history-rc.sh" ]] && source "$HOME/.history-rc.sh"

## Stuff that doesn't fit in any of above files, and doesn't (yet) deserve a file of its own:
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx # LSCOLORS for black background shell

if which jenv > /dev/null; then eval "$(jenv init -)"; fi
# if which docker-machine > /dev/null; then eval "$(docker-machine env default)"; fi
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export PATH="/usr/local/opt/ansible@2.0/bin:$PATH"
export PATH="$HOME/.rvm/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

hitch() {
  command hitch "$@"
  if [[ -s "$HOME/.hitch_export_authors" ]] ; then source "$HOME/.hitch_export_authors" ; fi
}
alias unhitch='hitch -u'
