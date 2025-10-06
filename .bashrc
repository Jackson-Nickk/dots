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

# Import Aliases
source ~/.config/shellrc/aliases

# Import Functions
source ~/.config/shellrc/functions

# HomeBrew
if [ -d "/home/linuxbrew/" ]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
