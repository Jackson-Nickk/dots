# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Git Prompt
. ~/.config/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
PS1='[\u \w]$(__git_ps1 " (%s)")\$ '

# Optional shell options
shopt -s autocd
shopt -s cdspell
shopt -s checkjobs
shopt -s dirspell
shopt -s execfail

# Aliases
alias g='grep'
alias cls='clear'
alias q='exit'
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -lha'
alias ff='fastfetch'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'
alias mkdir='mkdir -p'
alias btop='btop --force-utf'
alias h='hx'
alias info='info --vi-keys'
alias pgrep='pgrep -a'
alias poweroff='doas poweroff'
alias reboot='doas reboot'
alias -- -='pwd'
alias j='jobs'
alias r='fc -s'
alias xi='doas xbps-install -S'
alias xu='doas xbps-install -Su'
alias xq='xbps-query'
alias xs='xbps-query -Rs'
alias xr='doas xbps-remove'
alias o='xdg-open'
alias cmctl='connmanctl'
alias lssvs='ls /etc/sv'
alias lssve='ls /var/service'
alias lf='lfcd'
alias pull='git pull'
alias push='git push'
alias commit='git commit'


# LFCD
lfcd () {
    # `command` is needed in case `lfcd` is aliased to `lf`
    cd "$(command lf -print-last-dir "$@")"
}

# Make a directory and enter it
mkcd ()
{
    mkdir -p -- "$1" && cd -P -- "$1"
}

# Universal extract function
extract ()
{
    if [ -f "$1" ] ; then
        case "$1" in
            *.tar.bz2)   tar xvjf "$1"    ;;
            *.tar.gz)    tar xvzf "$1"    ;;
            *.bz2)       bunzip2 "$1"     ;;
            *.rar)       unrar x "$1"     ;;
            *.gz)        gunzip "$1"      ;;
            *.tar)       tar xvf "$1"     ;;
            *.tbz2)      tar xvjf "$1"    ;;
            *.tgz)       tar xvzf "$1"    ;;
            *.zip)       unzip "$1"       ;;
            *.Z)         uncompress "$1"  ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# HomeBrew
if [ -d "/home/linuxbrew/" ]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
