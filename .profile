#!/bin/sh

export EDITOR=hx
export PATH=$PATH:/home/jack/sc
export PATH=$PATH:/home/jack/go/bin
export MANPAGER="less -R --use-color -Dd+r -Du+b -Dk+y"
export PAGER="less -R --use-color -Dd+r -Du+b -Dk+y"
export QT_QPA_PLATFORM=wayland
export MOZ_ENABLE_WAYLAND=1

if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# Created by `pipx` on 2025-07-30 12:30:56
PATH="$PATH:/home/jack/.local/bin"

# dwl -s startup.sh &

