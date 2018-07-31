#!/bin/bash
###########################################################################################################
# .make.sh
# This script creates symlinks from the home directory to speficied files in the dotfiles directory
###########################################################################################################
set -x

dir=$HOME/dotfiles                      # dotfiles directory
olddir=$HOME/dotfiles_old               # backup directory for old dotfiles
files="vim config/nvim zshrc tmux.conf virtualenvs/postactivate virtualenvs/postdeactivate"         # List of files/directories to link

echo "Creating backup directory $olddir"
mkdir -p $olddir
echo "...done"

echo "chdir to $dir"
cd $dir
echo "...done"

for file in $files; do
  echo "Moving existing file, $file, to $olddir"
  mv $HOME/.$file $olddir
  echo "Creating symlink to $file in $dir"
  ln -s $dir/.$file $HOME/.$file
done

