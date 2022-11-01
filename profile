
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
export STARSHIP_CONFIG=/etc/starship.toml
