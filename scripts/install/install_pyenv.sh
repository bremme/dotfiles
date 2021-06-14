#!/usr/bin/env bash

source $(dirname "$0")/../utils.sh
source $(dirname "$0")/../../config.sh

function install_pyenv() {
    local name="PyEnv"
    if [ -d "$HOME/.pyenv" ]; then
        log_error "'$name' already installed, skipping"
        exit 1
    fi
    log_info "Install '$name'"
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv

    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"

    log_info "Installing PyEnv build dependencies"
    sudo apt-get install -y --no-install-recommends -y \
        make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev \
        libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev \
        libxmlsec1-dev libffi-dev liblzma-dev

    sudo apt-get install python3-distutils python3-pip

    # install python versions
    log_info "Install PyEnv Python versions"
    for version in "${PYENV_VERSIONS[@]}"
    do
        pyenv install "$version"
    done

    # set global version
    log_info "Set PyEnv global version"
    pyenv global $PYENV_GLOBAL_VERSION

    # install
    pip install --upgrade pip
    pip install ${PYENV_DEFAULT_PACKAGES[*]}

    # install pyenv-virtualenv
    git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv

    log_info "Finished installing '$name'"
}

function uninstall_pyenv() {
    log_warning "Uninstalling PyEnv."
    if [ -d "$HOME/.pyenv" ]; then
        rm -rf "$HOME/.pyenv"
    fi
}

(return 0 2>/dev/null) && sourced=true || sourced=false

if [ $sourced = false ]; then
    install_pyenv
fi


