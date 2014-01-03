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

###
## Environment Variables
# 

export EDITOR=/usr/bin/vim

# Needed for ipkg
PATH=/opt/bin:/opt/sbin:$PATH
export PATH

# less is more
if [ -f /opt/bin/less-less ] ; then
  PAGER=less
else
  PAGER=more
fi

export PAGER

# Homebrew Cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

###
## bash!
# 

# Give me bash!
if [ -x /opt/bin/bash ]; then
  exec /opt/bin/bash
fi
