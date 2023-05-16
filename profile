if [ -f "/opt/perlbrew/etc/bashrc" ]; then source /opt/perlbrew/etc/bashrc; fi

if [ -x /usr/libexec/path_helper ]; then
	eval `/usr/libexec/path_helper -s`
fi

if [ "${BASH-no}" != "no" ]; then
	[ -r /etc/bashrc ] && . /etc/bashrc
fi

eval "$(/opt/homebrew/bin/brew shellenv)"
export BASH_SILENCE_DEPRECATION_WARNING=1
export STARSHIP_CONFIG=/etc/starship.toml
