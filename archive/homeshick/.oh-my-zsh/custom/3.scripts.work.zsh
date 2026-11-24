DEFAULT_NAMESPACE=csf

function getCluster() {
    echo $(kubectl config current-context)
}

# Usage follow-event-listener <namespace> <event-listener>
function followEventListener() {
    namespace=$1
    eventListener=$2
    cluster=$(getCluster)

    if [[  "$cluster" != 'pax-so-tst' ]]; then
        pax-kubectl-login -c pax-so-tst
    fi

    kubectl -n $namespace logs -f $(kubectl -n $namespace get pods -l eventlistener=$eventListener -o jsonpath='{.items[0].metadata.name}') | jq
}

# follow-git-trigger <product>
function followGitTrigger() {
    local product=${1:-$DEFAULT_NAMESPACE}
    local namespace=gaas-$product-ops
    followEventListener $namespace git-trigger
}

# follow-pact-trigger <product>
function followPactTrigger() {
    local product=${1:-$DEFAULT_NAMESPACE}
    local namespace=gaas-$product-ops
    followEventListener $namespace pact-trigger
}

# follow-deployment <namespace> <deployment>
function followDeployment() {
    local namespace=$1
    local deployment=$2
    kubectl -n $namespace -l app=$deployment logs -f  | tee >(grep -v "^{") | grep "^{" | jq 'select(.log.level == "ERROR" or .log.level == "WARNING")'
}

# get-deployment <namespace>
function getDeployment() {
    local namespace=$namespace
    kubectl -n $namespace get deployments
}