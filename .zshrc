# 1. Rutas del Sistema (Siempre arriba del todo)
# --------------------------------------------------------------------
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export NVM_DIR="$HOME/.nvm"
export STARSHIP_CONFIG="$HOME/.dotfiles/starship.toml"

# 2. Cargar NVM de forma perezosa (Evita que la terminal se quede colgada)
# --------------------------------------------------------------------
if [ -s "/opt/homebrew/opt/nvm/nvm.sh" ]; then
  alias node='unalias node npm nvm; source /opt/homebrew/opt/nvm/nvm.sh; node'
  alias npm='unalias node npm nvm; source /opt/homebrew/opt/nvm/nvm.sh; npm'
  alias nvm='unalias node npm nvm; source /opt/homebrew/opt/nvm/nvm.sh; nvm'
fi

# 3. Aliases
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

# 4. Historial
# --------------------------------------------------------------------
bindkey "\e[A" history-beginning-search-backward
bindkey "\e[B" history-beginning-search-forward

# 5. Plugins de Zsh optimizados (Sin atascos)
# --------------------------------------------------------------------
# Cargamos las funciones del sistema base de Zsh primero
fpath=(/opt/homebrew/share/zsh/site-functions $fpath)

# Cargamos compinit saltándonos la comprobación pesada de seguridad
autoload -U compinit && compinit -C -u

# Cargar los plugins directamente si existen
if [ -f "/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
  source "/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

if [ -f "/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  source "/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# 6. Inicializar el Prompt (Starship)
# --------------------------------------------------------------------
eval "$(starship init zsh)"