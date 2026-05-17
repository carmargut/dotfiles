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


# History search
# --------------------------------------------------------------------

bindkey "\e[A" history-beginning-search-backward
bindkey "\e[B" history-beginning-search-forward


# Plugins
# --------------------------------------------------------------------

if [[ "$OSTYPE" == "darwin"* ]]; then
  _ZSH_PLUGIN_DIR=$(brew --prefix)/share
else
  _ZSH_PLUGIN_DIR=/usr/share
fi

fpath=("$_ZSH_PLUGIN_DIR/zsh-completions" $fpath)
autoload -U compinit && compinit

source "$_ZSH_PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$_ZSH_PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"


# Prompt
# --------------------------------------------------------------------

eval "$(starship init zsh)"
