command -v nvim >/dev/null && alias vim="nvim" vimdiff="nvim -d"
alias ga='git add .'
alias gss='git status'
alias gcm='git commit -m'
alias gcu='git checkout'
alias desk='cd ~/Desktop/'
alias down='cd ~/Downloads/'
alias cpath='pwd|pbcopy'
alias r='exec $SHELL'

alias personal='cd ~/Desktop/coding-thangs/personal'
alias xendit='cd ~/Desktop/coding-thangs/xendit'
alias gignite='cd ~/Desktop/coding-thangs/gignite'


# Use direnv
eval "$(direnv hook zsh)"
alias ls="eza --icons=always"

# Use zoxide
eval "$(zoxide init zsh)"
alias cd="z"
