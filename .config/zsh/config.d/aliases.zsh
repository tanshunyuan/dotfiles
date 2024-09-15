command -v nvim >/dev/null && alias vim="nvim" vimdiff="nvim -d"
alias ga='git add .'
alias gss='git status'
alias gcm='git commit -m'
alias gcu='git checkout'
alias desk='cd ~/Desktop/'
alias down='cd ~/Downloads/'
alias bconfig='vim ~/.config/bspwm/bspwmrc'
alias kconfig='vim ~/.config/sxhkd/sxhkdrc'
alias pconfig='vim ~/.config/polybar/modules.ini'
alias nconfig='vim ~/.config/nvim/init.vim'
alias cpath='pwd|pbcopy'
alias r='exec $SHELL'

alias personal='cd ~/Desktop/coding-thangs/personal'
alias xendit='cd ~/Desktop/coding-thangs/xendit'
alias gignite='cd ~/Desktop/coding-thangs/gignite'
# alias kubectl='minikube kubectl --'
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'

