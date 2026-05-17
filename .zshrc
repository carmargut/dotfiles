# Aliases
# --------------------------------------------------------------------

alias ..='cd ..'
alias ll='ls -lathr'
alias la='ls -A'
alias l='ls -CF'
alias gitv='git log --graph --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
alias home='cd ~'
alias root='cd /'
alias myip="curl https://icanhazip.com"
alias ls='ls --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


# Exports
# --------------------------------------------------------------------

export PATH=/opt/homebrew/bin:$PATH
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh


# Prompt
# --------------------------------------------------------------------

eval "$(starship init zsh)"
