# Completion listing extensions (allows menuselect)
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# zsh-auto-complete

## Vim Stuff START
# Set Vim
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'left' vi-backward-char
bindkey -M menuselect 'down' vi-down-line-or-history
bindkey -M menuselect 'up' vi-up-line-or-history
bindkey -M menuselect 'right' vi-forward-char

# Edit line in vim buffer ctrl-v
bindkey '^v' edit-command-line
autoload edit-command-line; zle -N edit-command-line
# Enter vim buffer from normal mode
autoload -U edit-command-line && zle -N edit-command-line && bindkey -M vicmd "^v" edit-command-line
# Enable searching through history
bindkey '^R' history-incremental-pattern-search-backward
# Fix backspace bug when switching modes
bindkey "^?" backward-delete-char

## Vim Stuff END