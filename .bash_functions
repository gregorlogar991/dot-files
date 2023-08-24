function write_line() {
    LINES=10
    if [[ ${1} =~ ^[0-9]+$ ]]; then
        LINES=${1}
    fi
    for i in $(seq $LINES); do echo -n "-"; done
    echo ""
}

function coffee() {
    if [[ ! -v COFFEE_PID ]]; then
        export COFFEE_PID=$!
        echo "Running 'caffeinate' in the background."
        echo "PID: ${COFFEE_PID}"
    else
    if [[ $(ps aux | grep "$COFFEE_PID" | grep "caffeinate" | wc -l) -gt 0 ]]; then
        echo "Killing 'caffeinate' process with PID ${COFFEE_PID}"
        kill "${COFFEE_PID}"
        unset COFFEE_PID
        else
            echo "This process ID is not from caffeinate! Please kill the process manually!"
        fi
    fi
}

# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$_";
}

#### GIT ####
gadd() {
	git status
    write_line 50
    git add --all --verbose
    write_line 50
	git commit -S -m "$1"
}

#### DOCKER ####

toolbox() {
    podman run --rm -it --hostname toolbox --platform linux/arm64 ${@} ghcr.io/gregorlogar991/toolbox:latest /bin/bash
}

wuzz() {
    podman run --rm -it --name wuzz gregorlogar991/wuzz:v0.5.0
}

#naabu() {
#    podman run --rm projectdiscovery/naabu $@
#}

jenkins-local() {
    podman run --name local-jenkins --rm  -d -p 50000:50000 -p 8080:8080 -v /Users/glogar/local-jenkins:/var/jenkins_home jenkins/jenkins
}

#### K8s ####
kn() {
    if [ "$1" != "" ]; then
        kubectl config set-context --current --namespace=$1
    else
        echo -e "\e[1;31m Error, please provide a valid Namespace\e[0m"
    fi
}

podman-buildx() {
    usage() {
        echo "Usage: podman-buildx <image-name> <image-version>"
    }

    if [[ "$1" == "" || "$2" == "" ]]; then
        usage
    else  
        IMAGE_NAME=$1
        VERSION=$2

        podman manifest create $1
        write_line 50
        podman build --tag "${1}:${2}" --manifest ${1} --arch amd64 .
        write_line 50
        podman build --tag "${1}:${2}" --manifest ${1} --arch arm64 .
        write_line 50
        podman manifest push --all ${1} "docker://${1}:${2}"
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

#### AWS #####

ct-aws-devops-admin() {
    export $(printf "AWS_ACCESS_KEY_ID=%s AWS_SECRET_ACCESS_KEY=%s AWS_SESSION_TOKEN=%s" \
    $(aws sts assume-role \
    --role-arn arn:aws:iam::XXXXXXXXXXXX:role/OrganizationAccountAccessRole \
    --role-session-name glogar-admin-devops \
    --query "Credentials.[AccessKeyId,SecretAccessKey,SessionToken]" \
    --output text))
}

ct-aws-sandbox-admin() {
    export $(printf "AWS_ACCESS_KEY_ID=%s AWS_SECRET_ACCESS_KEY=%s AWS_SESSION_TOKEN=%s" \
    $(aws sts assume-role \
    --role-arn arn:aws:iam::XXXXXXXXXXXX:role/OrganizationAccountAccessRole \
    --role-session-name glogar-reader-devops \
    --query "Credentials.[AccessKeyId,SecretAccessKey,SessionToken]" \
    --output text))
}


####  ####

urlencode() {
    python3 -c "from pwn import *; print(urlencode('$1'));"
}

urldecode() {
    python3 -c "from pwn import *; print(urldecode('$1'));"
}

function extract {
  if [ -z "$1" ]; then
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
  else
    if [ -f $1 ]; then
      case $1 in
        *.tar.bz2)   tar xvjf $1    ;;
        *.tar.gz)    tar xvzf $1    ;;
        *.tar.xz)    tar xvJf $1    ;;
        *.lzma)      unlzma $1      ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar x -ad $1 ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xvf $1     ;;
        *.tbz2)      tar xvjf $1    ;;
        *.tgz)       tar xvzf $1    ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *.xz)        unxz $1        ;;
        *.exe)       cabextract $1  ;;
        *)           echo "extract: '$1' - unknown archive method" ;;
      esac
    else
      echo "$1 - file does not exist"
    fi
  fi
}