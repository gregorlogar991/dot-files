#!/bin/bash

CUR_DATE="$(date +"%y%m%d")"
usage() { echo "Usage: $0 [git|export|all]" 1>&2; exit 1; }

export_files () {
   cp "~/Library/Application Support/k9s/plugins.yaml" ~/dot-files/k9s/
   cp "~/Library/Application Support/k9s/mts-version.sh" ~/dot-files/k9s/
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
      export_files
      ;;
   "all")
      export_files
      push_to_git
      ;;
   *)
      usage
      ;;
esac
