#####
####
### User specific aliases and functions
##  Scott Granneman scott@granneman.com
#

###
## SSH
# 

knownhosts () {
  cp ~/.ssh/known_hosts ~/.ssh/known_hosts_$(date +%Y%m%d-%H%M%S) ; 
  sed -e "$1d" ~/.ssh/known_hosts > ~/.ssh/known_hosts_new ; 
  mv ~/.ssh/known_hosts_new ~/.ssh/known_hosts ; 
  chmod 644 ~/.ssh/known_hosts
}

# List all hosts in the SSH config file
alias sshconfig='egrep "^Host" ~/.ssh/config'

###
## ls
# 

# -A Hide . & ..
# -a Show all, including . & ..
# -d List directory entries instead of contents
# -F Append indicator [*/=@|] to entries
# -h Human readable: K, M, G, T
# -l Long
# -1 Single column

alias l='/bin/ls -F --color=auto'
alias l1='/bin/ls -1 --color=auto'
alias la='/bin/ls -AF --color=auto'
alias ld='/bin/ls -l | grep "^d"'
alias ldown='/bin/ls -AF $(ls -A)' # show current dir & all dirs one level down
alias ll='/bin/ls -lhFA --color=auto'
alias ls='/bin/ls -F --color=auto'
alias lsd='/bin/ls -d */'
alias lsize='/bin/ls -l | sort -r -n +4'

###
## man
# 

# Better man, as per http://lifehacker.com/#!5778769/make-the-man-command-more-useful-in-linux-and-os-x
man () {
  /usr/bin/man $@ || (help $@ 2> /dev/null && help $@ | less)
}

###
## history
# 

# Show the date & time in history
alias histdateon='export HISTTIMEFORMAT="%F %T "'
# Do NOT show the date & time in history
alias histdateoff='export HISTTIMEFORMAT=""'

###
## Web Dev
#

# Grab contents of Web page as text
alias lynxdump='lynx -dump $1 > ~/lynxdump'
alias wgetpage='wget --html-extension --recursive --convert-links --page-requisites --no-parent $1'

###
## Multimedia
#

# Download YouTube video
# $1 = YouTube URL
# $2 = Format number from ytformat command
ytdl () {
  youtube-dl -o '%(title)s.%(ext)s' -f $2 $1
}
# Figure out what formats are available for the YouTube video
# $1 = YouTube URL
alias ytformat='youtube-dl -F $1'

###
## Software Management
# 

# List all packages | grep for selected
alias deblist='dpkg -l | grep $1'

# List all packages & give installation status
alias debinstall='dpkg --get-selections'

###
## Utilities
#

# Get sizes of all subdirectories
alias subdirsize='du -cskh *'

# Always zip with maximum compression, recursively
alias zip='zip -r -9'

# Put each path on a separate line instead of running it all together
alias path='echo $PATH | tr ":" "\n"'

# List all functions
listfunc () {
  for func in $(compgen -A function | grep -v _)
  do 
    declare -f $func
    echo -e "\r"
  done
}
