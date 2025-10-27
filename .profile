# Jack's Profile

export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/sc:$PATH"
export PATH="/home/jack/go/bin:$PATH"
export EDITOR="kak"
export MANPAGER="less -R --use-color -Dd+r -Du+b -Dk+y"
export PAGER="less -R --use-color -Dd+r -Du+b -Dk+y"
export QT_QPA_PLATFORM="wayland"
export MOZ_ENABLE_WAYLAND="1"
export monosize="14"
export KAKOUNE_CONFIG_DIR="$XDG_CONFIG_HOME/kak"

if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

