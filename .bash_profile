alias vi='nvim'

if [[ $- != *i* ]]; then
    return
fi

if ! pgrep -x "Xorg" > /dev/null; then
    startx
fi
. "$HOME/.cargo/env"
