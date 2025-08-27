# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Git Prompt
. ~/.config/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
PS1='[\u \w]$(__git_ps1 " (%s)")\$ '

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

# lfcd
alias lf='lfcd'

lfcd () {
    # `command` is needed in case `lfcd` is aliased to `lf`
    cd "$(command lf -print-last-dir "$@")"
}
