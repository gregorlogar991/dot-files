#Tools
eval "$(starship init zsh)"
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

#Source
source ~/.aliases
source ~/.functions

#History
HISTSIZE=999999999
SAVEHIST=$HISTSIZE
setopt SHARE_HISTORY

#kubectl autocompletion
autoload -Uz compinit
compinit
source <(kubectl completion zsh)

# HSTR configuration - add this to ~/.zshrc
# HSTR configuration - add this to ~/.zshrc
alias hh=hstr                    # hh to be alias for hstr
setopt histignorespace           # skip cmds w/ leading space from history
export HSTR_CONFIG=hicolor,raw-history-view       # get more colors
export HISTFILE=~/.zsh_history
#bindkey -s "\C-r" "\C-a hstr -- \C-j"     # bind hstr to Ctrl-r (for Vi mode check doc)
export HSTR_TIOCSTI=y

export PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
