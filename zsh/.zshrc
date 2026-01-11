# HISTSIZE and SAVEHIST set the size of your history.
# EXTENDED_HISTORY adds timestamps to your history entries.
# autocd allows you to change directories without typing cd.
# compinit initializes the Zsh completion system.
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY
setopt autocd
autoload -U compinit; compinit

source <(fzf --zsh)

# User configuration
eval "$(starship init zsh)"
export PATH=$PATH:~/.local/bin

# Common aliases for colors
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'

# Vim keys
set -o vi
# Fix for backspace in vi mode
bindkey -v '^?' backward-delete-char
