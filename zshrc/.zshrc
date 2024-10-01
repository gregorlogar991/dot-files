#Tools
eval "$(starship init zsh)"

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi

autoload -U +X compinit && compinit

#Source
source ~/.aliases
source ~/.functions
source ~/.zsh-plugins/git.plugin.zsh
source ~/.sportradar

#History
HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

alias hh=hstr                    # hh to be alias for hstr

export HSTR_CONFIG=hicolor,raw-history-view       # get more colors
export HSTR_TIOCSTI=y

export PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
export PATH="/Users/g.logar/mssh/bin:$PATH"
export PATH="/Users/g.logar/go/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql-client@8.4/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#[ -f ~/fzf-tab/fzf-tab.plugin.zsh ] && source ~/fzf-tab/fzf-tab.plugin.zsh

eval "$(direnv hook zsh)"
export PATH="/opt/homebrew/opt/mongodb-community@4.4/bin:$PATH"

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source <(kubectl-argo-rollouts completion zsh)
source <(stern --completion=zsh)

eval "$(zoxide init zsh)"
source <(kubectl completion zsh)
alias kubectl=kubecolor
# make completion work with kubecolor
compdef kubecolor=kubectl

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:z:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/g.logar/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"

export EDITOR=nvim
