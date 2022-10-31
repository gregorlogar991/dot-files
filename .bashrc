kn() {
    if [ "$1" != "" ]; then
        kubectl config set-context --current --namespace=$1
    else
        echo -e "\e[1;31m Error, please provide a valid Namespace\e[0m"
    fi
}



knd() {
    kubectl config set-context --current --namespace=default
}



ku() {
    kubectl config unset current-context
}



ks() {
    aws eks --region eu-central-1 update-kubeconfig --name ct-cl
}



eval "$(/opt/homebrew/bin/brew shellenv)"
export GROOVY_HOME=/opt/homebrew/opt/groovy/libexec
#Python
export PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin:${PATH}"
export PATH="/Users/gregalogar/.local/bin:$PATH"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh



### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/glogar1/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
# HSTR configuration - add this to ~/.bashrc
alias hh=hstr                    # hh to be alias for hstr
export HSTR_CONFIG=hicolor       # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
# ensure synchronization between bash memory and history file
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hstr -- \C-j"'; fi
# if this is interactive shell, then bind 'kill last command' to Ctrl-x k
if [[ $- =~ .*i.* ]]; then bind '"\C-xk": "\C-a hstr -k \C-j"'; fi
