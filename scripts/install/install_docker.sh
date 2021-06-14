#!/usr/bin/env bash

source $(dirname "$0")/../utils.sh

DOCKER_COMPOSE_VERSION="1.29.2"
declare -a DEPENDENCIES=(apt-get install apt-transport-https ca-certificates curl gnupg lsb-release)

function install_docker() {
    local name="Docker (deb)"

    log_info "Install dependencies for '$name'"
    sudo apt install ${DEPENDENCIES[*]}
    # 1. Set up the repository
    sudo apt update
    sudo apt install ${DEPENDENCIES[*]}

    log_info "Install '$name'"
    log_info "Add Docker GPG key"
    # 2. Add Docker’s official GPG key:
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

    # 3. Use the following command to set up the stable repository.
    echo \
    "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    # 4. Update repo's and install Docker
    sudo apt update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io

    # Install docker compose
    if [ $(confirm "Do you want to install 'Docker Compose' as well?") = true ]; then
        sudo curl -L "https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

        sudo chmod +x /usr/local/bin/docker-compose
        # TODO check if docker-compose is on PATH
    fi
}

(return 0 2>/dev/null) && sourced=true || sourced=false

if [ $sourced = false ]; then
    install_docker
fi
