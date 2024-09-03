[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "$HOME/.config/zsh-frappe-highlighting.zsh"
plug "zsh-users/zsh-syntax-highlighting"

# Load and initialise completion system
autoload -Uz compinit
compinit

# history setup
setopt SHARE_HISTORY
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt HIST_EXPIRE_DUPS_FIRST

# autocompletion using arrow keys (based on history)
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward


# autocomplete key binds
bindkey '^I'   complete-word    # tab | complete
bindkey '^ ' autosuggest-accept  # ctr + space | autosuggest

# Aliases

alias cd="z"
alias cat='bat'
alias zed='zeditor'

# Remove the ls alias
unalias ls

# Define function alias for ls command
ls() {
  if [[ "$*" == "-la" ]]; then
    command eza -la --no-time --no-permissions
  elif [[ "$*" == "-l" ]]; then
    command eza -l --no-time --no-permissions
  else
    command eza "$@"
  fi
}


alias beavis='cowsay -f beavis.zen'
alias pacnews='pacnews | cat'
alias lsd='lolcat'
alias shut='shutdown now'

export STARSHIP_CONFIG=~/Dotfiles/zsh/.config/starship.toml

eval "$(zoxide init zsh)"
eval "$(thefuck --alias)"
eval "$(starship init zsh)"


# bun completions
[ -s "/home/goup/.bun/_bun" ] && source "/home/goup/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export TERMINAL=/usr/bin/alacritty
