alias ls='ls -GFh'

function tabname {
  printf "\e]1;$1\a"
}


# Use VIM instead of nano for arcanist
export EDITOR=vim

#-------------probably won't ever change below here
# bobthecow git completion on github
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

#---- change colors on ls command to fit theme
export CLICOLOR=1
export LSCOLORS=gxBxhxDxBxhxhxhxhxcxcx

export GIT_PS1_SHOWDIRTYSTATE=1 GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_DESCRIBE_STYLE=branch
export GIT_PS1_SHOWCOLORHINTS=0
export PROMPT_COMMAND='__git_ps1 "\n\w" "\n  > " "  { %s }"'i
