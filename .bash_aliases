####aliases####
# Search command line history
alias h="history | grep "

# Search running processes
alias p="ps aux | grep "

alias weatherLj='curl wttr.in/Ljubljana'
alias weatherRib='curl wttr.in/Ribnica'

#GIT
alias g="git"
alias gitlog="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

#Info
alias help2="tldr"
alias space="ncdu"
alias sysinfo="neofetch | lolcat"
alias df="df -h"
alias procs='ps -eo pid,user,stime,etime,cmd'
alias ports='netstat -anp | grep -i listen'

#Files
alias ll='exa --icons --group-directories-first -l --git -g --time modified --sort newest'
alias ls='exa --icons --group-directories-first'
alias lls='ls --human-readable --size -1 -S --classify'
alias llt='ls -t -1'
alias count='find . -type f | wc -l'
alias cpv='rsync -ah --info=progress2'
alias cls='clear'
alias cat="bat"
alias tree="exa --tree --icons"
alias tree2="broot"
alias mkdir="mkdir -p"

#Tools
alias vim="hx"
alias k="kubectl"
alias kcntx="kubectl config current-context"
alias tf="terraform"
alias pwsh="/usr/local/microsoft/powershell/7/pwsh ; exit;"
alias ap="ansible-playbook"
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'

#AWS
alias awsExport='env | grep -i aws | sed "s/^/export /"'
alias awsLogin="source ~/CT360/awslogin.sh"
alias awsCredentials="aws sts get-caller-identity"

# Nav
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias -- -="cd -"

# Shortcuts
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias jira="cd ~/JIRA"


# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Get week number
alias week='date +%V'

# Google Chrome
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# macOS has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"

# macOS has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Lock the screen (when going AFK)
alias afk="pmset displaysleepnow"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'
