# ~/.profile: executed by the command interpreter for login shells

###
## Original Syno .profile
# 

umask 022

PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/syno/sbin:/usr/syno/bin:/usr/local/sbin:/usr/local/bin
export PATH

TERM=${TERM:-cons25}
export TERM

# PAGER=more
# export PAGER

# PS1="`hostname`> "

###
## Basics
# 

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS
shopt -s checkwinsize

###
## Prompt & terminal title
# 

# Newline (\n) before every prompt for nice spacing
# Color prompt
# 30m - Black
# 31m - Red
# 32m - Green
# 33m - Yellow
# 34m - Blue
# 35m - Purple
# 36m - Cyan
# 37m - White
# Everything else is green...
# 0 - Normal
# 1 - Bold
# 2 - 
function prompt {
  local BLACK="\[\033[0;30m\]"
  local RED="\[\033[0;31m\]"
  local GREEN="\[\033[0;32m\]"
  local YELLOW="\[\033[0;33m\]"
  local BLUE="\[\033[0;34m\]"
  local PURPLE="\[\033[0;35m\]"
  local CYAN="\[\033[0;36m\]"
  local WHITE="\[\033[0;37m\]"
  local WHITEBOLD="\[\033[1;37m\]"
export PS1="
${GREEN}\u${GREEN}@${GREEN}\h:${BLUE}\w${WHITE}
$ "
}
prompt

# Change Terminal title to include hostname,
# current working directory, & current program
# Example: virgil:~/bin/dotfiles (bash)
export PROMPT_COMMAND='echo -ne "\033]0;$(echo $HOSTNAME | cut -d . -f 1):${PWD/$HOME/~}\007"'

###
## Environment Variables
# 

export EDITOR=/usr/bin/vim

# Needed for ipkg
PATH=/opt/bin:/opt/sbin:$PATH
export PATH

# less is more
if [ -f /opt/bin/less ] ; then
  PAGER=less
else
  PAGER=more
fi

export PAGER
