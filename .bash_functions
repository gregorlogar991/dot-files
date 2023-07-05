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
	git commit -m "$1"
}

#### DOCKER ####

toolbox() {
    podman run --rm -it --hostname toolbox --platform linux/arm64 ${@} ghcr.io/gregorlogar991/toolbox:latest /bin/bash
}

wuzz() {
    podman run --rm -it --name wuzz gregorlogar991/wuzz:v0.5.0
}

naabu() {
    podman run --rm projectdiscovery/naabu $@
}

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

ct-aws-edit-admin() {
    export $(printf "AWS_ACCESS_KEY_ID=%s AWS_SECRET_ACCESS_KEY=%s AWS_SESSION_TOKEN=%s" \
    $(aws sts assume-role \
    --role-arn arn:aws:iam::XXXXXXXXXXXX:role/OrganizationAccountAccessRole \
    --role-session-name glogar-admin-devops \
    --query "Credentials.[AccessKeyId,SecretAccessKey,SessionToken]" \
    --output text))
}

ct-aws-greenlake-admin() {
    export $(printf "AWS_ACCESS_KEY_ID=%s AWS_SECRET_ACCESS_KEY=%s AWS_SESSION_TOKEN=%s" \
    $(aws sts assume-role \
    --role-arn arn:aws:iam::XXXXXXXXXXXX:role/OrganizationAccountAccessRole \
    --role-session-name glogar-admin-devops \
    --query "Credentials.[AccessKeyId,SecretAccessKey,SessionToken]" \
    --output text))
}

ct-aws-morpheus-admin() {
    export $(printf "AWS_ACCESS_KEY_ID=%s AWS_SECRET_ACCESS_KEY=%s AWS_SESSION_TOKEN=%s" \
    $(aws sts assume-role \
    --role-arn arn:aws:iam::XXXXXXXXXXXX:role/OrganizationAccountAccessRole \
    --role-session-name glogar-admin-devops \
    --query "Credentials.[AccessKeyId,SecretAccessKey,SessionToken]" \
    --output text))
}

ct-aws-devops() {
    export $(printf "AWS_ACCESS_KEY_ID=%s AWS_SECRET_ACCESS_KEY=%s AWS_SESSION_TOKEN=%s" \
    $(aws sts assume-role \
    --role-arn arn:aws:iam::XXXXXXXXXXXX:role/devops \
    --role-session-name glogar-devops-devops \
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
