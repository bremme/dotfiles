#!/usr/bin/env bash

source $(dirname "$0")/utils.sh
source $(dirname "$0")/../config.sh

APPDATA_HOME="$HOME/appdata"

declare -a APPDATA_DIRS=(
    "."
    ".config"
    ".local/share"
)
SAVEIFS=$IFS
IFS=$(echo -ne "\n\b")


for dir in ${APPDATA_DIRS[@]}; do
    log_info "Create directory (if not exist)"
    mkdir -p "$APPDATA_HOME/$dir"

    log_info "Linking directories in '$APPDATA_HOME/$dir' to '$HOME/$dir'"
    # for appdir in $(ls -a $APPDATA_HOME/$dir); do
    for appdir in $(ls -1a $APPDATA_HOME/$dir); do
        # don'l link top level folders
        if [[ ${APPDATA_DIRS[@]} =~ ${appdir} ]]; then
            continue
        fi
        log_debug "ln -s -v $(realpath $APPDATA_HOME/$dir/$appdir) $(realpath $HOME/$dir/)"
        # check if destination dir exists (and is not a symlink already)
        if [[ -d $HOME/$dir/$appdir && ! -L $HOME/$dir/$appdir ]]; then
            move_dest="$HOME/$dir/$appdir.backup.$(uuidgen)"
            log_warning "Destination already exists, moving to $move_dest"
            # move to unique backup location
            mv "$HOME/$dir/$appdir" "$move_dest"
        fi

        ln -sf "$(realpath "$APPDATA_HOME/$dir/$appdir")" "$(realpath "$HOME/$dir/")"
    done
done

IFS=$SAVEIFS