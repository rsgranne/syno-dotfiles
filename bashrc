###
## Basics
# 

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS
shopt -s checkwinsize

###
## History
# 

# Number of history commands to keep in the history list of current session
export HISTSIZE=2000

# Maximum number of commands in history file; 
# if HISTFILESIZE isn't set, no truncation is performed
export HISTFILESIZE=10000

# Tell bash to append history, not overwrite it, when you close a session
shopt -s histappend

# Record each line of history as you enter it, not when you close a session
export PROMPT_COMMAND='history -a'

# Don't put duplicate lines in the history
# Don't put blank lines in the history
export HISTCONTROL=ignoredups:ignorespace

# Ignore unnecessary items in history
# Duplicates, ls & variations, bf/bg, & exit
export HISTIGNORE="&:l[als]:[bf]g:exit"

# Verify substituted history expansion before running
shopt -s histverify

# Save each line of a multi-line command in the same history entry
shopt -s cmdhist

# Disable terminal flow control so that Ctrl-s does forward history searching
# See http://ruslanspivak.com/2010/11/25/bash-history-incremental-search-forward/
stty -ixon

###
## Ease of use
# 

# Alias definitions
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# Fix simple misspellings when cd-ing
shopt -s cdspell

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

export PS1="\n${GREEN}\u${GREEN}@${GREEN}\h:${BLUE}\w${WHITE}\n$ "
}
prompt

# Change Terminal title to include hostname,
# current working directory, & current program
# Example: virgil:~/bin/dotfiles (bash)
export PROMPT_COMMAND='echo -ne "\033]0;$(echo $HOSTNAME | cut -d . -f 1):${PWD/$HOME/~}\007"'
