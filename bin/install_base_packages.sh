#!/usr/bin/env bash
source "$(dirname "$0")/../lib/utils.sh"
source "$(dirname "$0")/../config.sh"


distro_id="$(get_distro_id)"

info "Distro is '$distro_id', filtering package list"

declare -a packages

for package in "${BASE_PACKAGES[@]}"; do
    package_name="${BASE_PACKAGES_DISTRO_OVERRIDES["$distro_id:$package"]:-$package}"
    packages+=("$package_name")
done

install_packages "${packages[@]}"
