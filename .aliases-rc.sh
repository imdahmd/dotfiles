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
alias nrepl='clj -M:cider-clj'
alias e='~/.emacslauncher'
alias dotfiles='git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'

function cloned {
    URL=$1
    REPO=`basename "$URL" .git`

    g clone $URL && cd $REPO
}

function gign {
    filename=$1
    echo "$filename" >> .gitignore
}

function claude {
    if [ $# -eq 0 ] && [ -f .claude.session ]; then
        local sid
        sid=$(cat .claude.session)
        if [ -n "$sid" ]; then
            command claude --resume "$sid"
            return
        fi
    fi
    command claude "$@"
}

