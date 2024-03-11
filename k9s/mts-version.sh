#!/bin/bash

# If you use k9s ( https://github.com/derailed/k9s ) you can try and use this script as k9s plugin.
#
## K9s plugin.yml (~/.k9s/plugin.yml or ~/Library/Application Support/k9s/plugin.yml on MAC)
#plugin:
#  mtsver:
#    shortCut: Ctrl-V
#    description: "MTS Versions"
#    scopes:
#      - pods
#    command: <path_to_this_script>
#    background: false
#    args:
#    - -C
#    - $CONTEXT
#    - -n
#    - $NAMESPACE
#    - -c
#    - mts-app


help() {
  echo "Shows Docker tags and images of pod-containers named 'mts-app' using current kubectl context and namespace."
  echo "Possible modifiers:"
	echo "-c <pod-container>           to change default container name (you can also export env. variable CONTAINER)"
	echo "-C <context>                 to change default context (you can also export env. variable CONTEXT)"
	echo "-n <namespace>               to change default namespace (you can also export variable NAMESPACE)"
	echo "-h                           help"
} >&2

while getopts ":n:C:c:s:h" opt; do
  case $opt in
    n)
      NAMESPACE=$OPTARG
      ;;
    C)
      CONTEXT=$OPTARG
      ;;
    c)
      CONTAINER=$OPTARG
      ;;
    h)
      help
      exit 0
      ;;
    s)
      SLEEP=$OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

THE_LINE="================================================================================================================================================================================"
FORMAT="%-30s %-60s %-60s %s\n"
CONTAINER="${CONTAINER:-mts-app}"
[[ -z "$CONTEXT" ]] && CONTEXT=$(kubectl config current-context)
[[ -z "$NAMESPACE" ]] && NAMESPACE=$(kubectl config get-contexts --no-headers "$CONTEXT" | awk "{print \$5}" | sed 's/^$/default/')

>&2 echo CONTEXT="$CONTEXT"
>&2 echo NAMESPACE="$NAMESPACE"
>&2 echo CONTAINER="$CONTAINER"
>&2 echo "$THE_LINE"
echo "\"DOCKER TAG\"" "\"DOCKER IMAGE\"" "\"POD NAME\"" "\"HELM RELEASE\"" | xargs printf "$FORMAT" >&2
>&2 echo "$THE_LINE"

kubectl get pods --context="$CONTEXT" -n "$NAMESPACE" -o jsonpath="{range .items[*]}{.spec.containers[?(@.name=='${CONTAINER}')].image}{':'}{.metadata.name}{':'}{.metadata.labels.app\.kubernetes\.io/instance}{'\n'}{end}" \
  | sed 's#^.*/##' \
  | sed -E 's/(.*):(.*):(.*):(.*)/\2 \1 \3 \4/' \
  | grep -v ':' \
  | xargs printf "$FORMAT" \
  | sort

>&2 echo "$THE_LINE"
echo "\"DOCKER TAG\"" "\"DOCKER IMAGE\"" "\"CRONJOB NAME\"" "\"HELM RELEASE\"" | xargs printf "$FORMAT" >&2
>&2 echo "$THE_LINE"

# containers[0] should be fixed is cronjobs will have more that one container
kubectl get cronjobs --context="$CONTEXT" -n "$NAMESPACE" -o jsonpath="{range .items[*]}{.spec.jobTemplate.spec.template.spec.containers[0].image}{':'}{.metadata.name}{':'}{.metadata.labels.app\.kubernetes\.io/instance}{'\n'}{end}"  \
  | sed 's#^.*/##' \
  | sed -E 's/(.*):(.*):(.*):(.*)/\2 \1 \3 \4/' \
  | grep -v ':' \
  | xargs printf "$FORMAT" \
  | sort

>&2 echo "$THE_LINE"

[[ -n "$SLEEP" ]] && echo "I will exit in $SLEEP seconds." && sleep "$SLEEP" && exit 0

>&2 echo "Hit enter to quit (maybe twice)!"
read -rs user_input
