alias e='emacsclient -c'
alias g=git
alias ls='ls -G'
alias la='ls -alt'
alias ll='ls -lt'
alias dev='cd ~/dev'
alias py=python
alias rerc='source ~/.bash_profile'
alias mci='mvn clean install'
alias mcis='mci -DskipTests'
alias v=vagrant
alias dm=docker-machine
alias uuidgen='uuidgen | tr "[:upper:]" "[:lower:]" | tr -d "\n"'
alias gacp='./gradlew aC && g push && say "pushing" || say "checks failed"'

function cloned {
    URL=$1
    REPO=`basename "$URL" .git`

    g clone $URL && cd $REPO
}

function gign {
    filename=$1
    echo "$filename" >> .gitignore
}
