# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/bashrc.pre.bash" ]] && builtin source "$HOME/.fig/shell/bashrc.pre.bash"
eval "$(starship init bash)"
export GROOVY_HOME=/opt/homebrew/opt/groovy/libexec

export PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin:${PATH}"
export PATH="/Users/glogar/.local/bin:$PATH"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="~/.fig/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
#export PATH="/Users/glogar/.rd/bin:$PATH"
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
source ~/.iterm2_shell_integration.bash

# HSTR configuration - add this to ~/.bashrc
export HSTR_CONFIG=hicolor       # get more colors
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=8000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
export SHELL_SESSION_HISTORY=0
shopt -s histappend                      # append to history, don't overwrite it
# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"


source <(kubectl completion bash)
complete -o default -F __start_kubectl k
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

if [ -e $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi
if [ -e $HOME/.bash_functions ]; then
    source $HOME/.bash_functions
fi

export dr="--dry-run=client -oyaml"
source /Users/glogar/.config/broot/launcher/bash/br
# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/bashrc.post.bash" ]] && builtin source "$HOME/.fig/shell/bashrc.post.bash"

