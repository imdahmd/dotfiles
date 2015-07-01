alias e=emacs
alias g=git
alias la='ls -alt'
alias ll='ls -lt'
alias target='cd ~/dev/target'
alias dev='cd ~/dev'
alias py=python

### Bash history related stuff ###
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it
# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

export NVM_DIR="/Users/imdadah/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

setjdk() {
    if [[ $(java -version 2>&1 | awk '/version/ {print $3}') != *$1* ]]; then
	echo "Setting jdk to version $1 for this session"
	export JAVA_HOME=$(/usr/libexec/java_home -v $1)
	sudo ln -nsf ${JAVA_HOME%/*} /System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK
    fi
}
setjdk 1.7
export RVM_HOME="$HOME/.rvm"
export POSTGRES_HOME="/Applications/Postgres.app/Contents/Versions/9.4"
export PATH="$POSTGRES_HOME/bin:$RVM_HOME/bin:$PATH"


