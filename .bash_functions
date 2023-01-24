# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$_";
}

#GIT
gadd() {
	git add --all
	git commit -m "$1"
	git status
}

#K8s
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

### AWS
