typeset -U PATH path
path=("$HOME/scripts" "$path[@]")
export PATH

export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox-developer-edition"
export WM="bspwm"
. "$HOME/.cargo/env"
