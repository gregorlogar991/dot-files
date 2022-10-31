# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$_";
}

gadd() {
	git add --all
	git commit -m "$1"
	git status
}
