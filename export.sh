#!/bin/bash

CUR_DATE="$(date +"%y%m%d")"
usage() { echo "Usage: $0 [git|export|all]" 1>&2; exit 1; }

mv_files () {
   echo "Exporting profiles!"
   cat /etc/profile > ~/dot-files/profile
   cat /etc/starship.toml > ~/dot-files/starship.toml
   cat ~/.bash_aliases > ~/dot-files/.bash_aliases
   cat ~/.bash_functions > ~/dot-files/.bash_functions
   cat ~/.bashrc > ~/dot-files/.bashrc
   cat ~/.vimrc > ~/dot-files/.vimrc
   cat ~/.config/nvim/init.vim > ~/dot-files/init.vim
   echo "Done!" ; echo "Brew bundle dump!"
   rm Brewfile
   brew bundle dump
   echo "Done!"
}

push_to_git () {
   cd ~/dot-files
   git add .
   git status
   git commit -m "💻 Update files - ${CUR_DATE}"
   git push --force
}

##########################################################################################

if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters!"
    usage
fi

case "$1" in
   "git")
      push_to_git
      ;;
   "export")
      mv_files
      ;;
   "all")
      mv_files
      push_to_git
      ;;
   *)
      usage
      ;;
esac
