### Python ###
export PATH=$PATH:$HOME/.local/bin
### Python ###

alias ls='ls -GFh --color=always'

### Fix for suckless terminal ###
function zle-line-init () { echoti smkx }
function zle-line-finish () { echoti rmkx }
zle -N zle-line-init
zle -N zle-line-finish
### FIx for suckless terminal ###


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export EDITOR="vim"

export PATH=$PATH:$HOME/.scripts

export PATH=$PATH:$HOME/Android/Sdk/platform-tools
export ANDROID_HOME=$HOME/Android/Sdk