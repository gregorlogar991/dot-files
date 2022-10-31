
###############################################################################
### CUSTOM PROFILE SETTINGS - BEGIN
###############################################################################
if [ -e $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi
if [ -e $HOME/.bash_functions ]; then
    source $HOME/.bash_functions
fi
#export PS1="\[$(tput bold)\]\[\033[38;5;21m\]\[\033[48;5;39m\]\u\[$(tput sgr0)\] at \[$(tput sgr0)\]\[\033[38;5;165m\]\[\033[48;5;183m\]\h\[$(tput sgr0)\] in \W\[$(tput sgr0)\] $ "
export NCURSES_NO_UTF8_ACS=1
if [ -f "/opt/perlbrew/etc/bashrc" ]; then source /opt/perlbrew/etc/bashrc; fi
function _update_ps1()
  {
    #export PS1="$(powerline-go -static-prompt-indicator -alternate-ssh-icon -condensed -modules time,user,ssh,host,cwd,git -cwd-mode plain -colorize-hostname)"
    export PS1="$(powerline-go -static-prompt-indicator -alternate-ssh-icon -git-mode compact -condensed -modules time,user,ssh,host,cwd,git -cwd-mode semifancy -cwd-max-depth 3 -error $? -shell bash)"
  }
PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
###############################################################################
### CUSTOM PROFILE SETTINGS - END
###############################################################################

if [ -x /usr/libexec/path_helper ]; then
	eval `/usr/libexec/path_helper -s`
fi

if [ "${BASH-no}" != "no" ]; then
	[ -r /etc/bashrc ] && . /etc/bashrc
fi

eval "$(/opt/homebrew/bin/brew shellenv)"
export BASH_SILENCE_DEPRECATION_WARNING=1
