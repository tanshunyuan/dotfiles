command -v nvim >/dev/null && alias vim="nvim" vimdiff="nvim -d"
alias ga='git add .'
alias gss='git status'
alias gcm='git commit -m'
alias gp='git pull'
alias gcu='git checkout'
alias doc='cd ~/Documents/'
alias cpath='pwd|pbcopy'
alias r='exec $SHELL'
alias vim='nvim'

# Use direnv
eval "$(direnv hook zsh)"
alias ls="eza --icons=always"

# Use zoxide
eval "$(zoxide init zsh)"
alias cd="z"
