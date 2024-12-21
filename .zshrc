# Load split configurations file from '.config/zsh/*'
for conf in "$HOME/.config/zsh/"*.zsh; do
  source "${conf}"
done
unset conf

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

fpath=($fpath "$HOME/.zfunctions")
# Autoload colors
autoload -U colors && colors

# Basic auto/tab complete:
zstyle ':completion:*' menu select
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Load zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
# Suggest aliases for commands
source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh 2>/dev/null
# Search repos for programs that can't be found
source /usr/share/doc/pkgfile/command-not-found.zsh 2>/dev/null

# For macos
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source $HOME/.docker/init-zsh.sh || true # Added by Docker Desktop

eval "$(starship init zsh)"
eval "$(/opt/homebrew/bin/mise activate zsh)"