#Tools
eval "$(starship init zsh)"

autoload -U +X compinit && compinit
source <(kubectl completion zsh)
alias kubectl=kubecolor
# make completion work with kubecolor
compdef kubecolor=kubectl

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source <(kubectl-argo-rollouts completion zsh)

#Source
source ~/.aliases
source ~/.functions
source ~/.zsh-plugins/git.plugin.zsh

#History
HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE

# HSTR configuration - add this to ~/.zshrc
# HSTR configuration - add this to ~/.zshrc
alias hh=hstr                    # hh to be alias for hstr
setopt histignorespace           # skip cmds w/ leading space from history
setopt hist_ignore_all_dups
setopt share_history
export HSTR_CONFIG=hicolor,raw-history-view       # get more colors
#bindkey -s "\C-r" "\C-a hstr -- \C-j"     # bind hstr to Ctrl-r (for Vi mode check doc)
export HSTR_TIOCSTI=y

export PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
export PATH="/Users/g.logar/mssh/bin:$PATH"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(direnv hook zsh)"
export PATH="/opt/homebrew/opt/mongodb-community@4.4/bin:$PATH"

