#!/bin/bash
 
#===============================================================================
#          FILE:  dotfiles.sh
#
#         USAGE:  ./dotfiles.sh
#
#   DESCRIPTION:  Creates symlinks for selected Git-backed dotfiles ~/bin/dotfiles
#
#        AUTHOR:  Scott Granneman (RSG), scott@ChainsawOnATireSwing.com
#       COMPANY:  
#       VERSION:  1.1
#       CREATED:  05/31/2012 14:07:19 CDT
#      REVISION:  05/03/2013 10:56:46 CDT 
#===============================================================================

###
## Variables
# 

dotsdir="bin/dotfiles"      # dotfiles directory
dotsdirbak="dotfiles_bak"   # old dotfiles backup directory

###
## Back up if necessary; create symlinks
# 

for dotfile in $(ls -1 ~/$dotsdir); do
  if [ -e ~/.$dotfile ] && [ ! -L .$dotfile ] ; then
    if [ ! -e ~/$dotsdirbak ] ; then
      echo "Creating a backup directory for existing dotfiles at ~/.$dotsdirbak"
      mkdir ~/.$dotsdirbak
      echo -e "… done\n"
    fi
    echo "Moving ~/.$dotfile to ~/.$dotsdirbak"
    mv ~/.$dotfile ~/.$dotsdirbak/
    echo -e "… done\n"
  fi
  echo "Creating symlink to $dotfile in home directory."
  ln -sf ~/$dotsdir/$dotfile ~/.$dotfile
  echo -e "… done\n"
done

# Remove unnecessary soft links

rm ~/.README.md
rm ~/.dotfiles.sh

# Source files

source ~/.profile
source ~/.bashrc
bind -f ~/.inputrc

###
## Create softlinks
#

ln -sf /volume1/music /music
ln -sf /volume1/homes /homes
ln -sf /volume2/video2 /video2
ln -sf /volume3/data /data
ln -sf /volume3/photo /photo
ln -sf /volume4/video /video
