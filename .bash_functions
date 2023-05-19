#Similar use as Amphetamine, but from terminal and buildin

function write_line() {
    LINES=10
    if [[ ${1} =~ ^[0-9]+$ ]]; then
        LINES=${1}
    fi
    for i in $(seq $LINES); do echo -n "-"; done
}

function coffee() {
    if [[ ! -v COFFEE_PID ]]; then
        caffeinate -d &
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

#GIT
gadd() {
	git status
    
    git add --all
	git commit -m "$1"
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

ct-aws-reader() {
    export $(printf "AWS_ACCESS_KEY_ID=%s AWS_SECRET_ACCESS_KEY=%s AWS_SESSION_TOKEN=%s" \
    $(aws sts assume-role \
    --role-arn arn:aws:iam::XXXXXXXXXXXX:role/reader \
    --role-session-name glogar-reader-devops \
    --query "Credentials.[AccessKeyId,SecretAccessKey,SessionToken]" \
    --output text))
}

