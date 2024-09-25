#!/usr/bin/env bash
# Use this script to relink all files/directory from the given location back to their target.

# For appdata it links directories by default unless they are excluded
# For root data it links files by default, directories can be linked if included


# Function to create symlink
create_symlink() {
    local src="$1"
    local dest="$2"

    if [[ -d "$dest" && ! -L "$dest" ]]; then
        backup_dest=$dest.$(uuidgen | cut -c 1-8).backup
        echo "[WARN] Destination already exist, moving to $backup_dest"
        if ! $DRY_RUN; then
            mv "$dest" "$backup_dest"
            echo "[INFO] mv $dest $backup_dest"
        else
            echo "[INFO] mv $dest $backup_dest (dry-run)"
        fi

    fi
    if ! $DRY_RUN; then
        ln -sf "$src" "$dest"
        echo "[INFO] ln -sf $src to $dest"
    else
        echo "[INFO] ln -sf $src to $dest (dry-run)"
    fi

}

is_ignored() {
    if [[ "$1" == "$IGNORE_FILE" ]]; then
        echo "[INFO] Ignore $1, default ignore file."
        return 0
    elif [[ ${IGNORE_LIST[*]} =~ $1 ]]; then
        echo "[INFO] Ignore $1 on ignore list."
        return 0
    fi
    return 1
}

traverse_directory() {
    local current_dir="$1"
    local relative_path="${current_dir#$SOURCE_DIR}"
    local destination_dir="$DEST_DIR$relative_path"

    find "$current_dir" -mindepth 1 -maxdepth 1 | while read -r entry; do
        local entry_name
        local dest_entry

        entry_name=$(basename "$entry")
        dest_entry="$destination_dir/$entry_name"

        if [ -d "$entry" ] && ! $IS_ROOTDATA; then
            if is_ignored "$entry_name"; then
                traverse_directory "$entry"
            else
                create_symlink "$entry" "$dest_entry"
            fi
        elif [ -f "$entry" ] && ! is_ignored "$entry_name"; then
            create_symlink "$entry" "$dest_entry"
        fi
    done
}

read_ignore_list() {
    if [ -f "$IGNORE_FILE_PATH" ]; then
        mapfile -t IGNORE_LIST < "$IGNORE_FILE_PATH"
    else
        IGNORE_LIST=()
    fi
}

help() {
    echo "Usage $(basename $0) [OPTIONS] DIR"
    echo ""
    echo "Relink all files and or directories from the given location to either"
    echo "/home/$USER or /. If the DIR argument is /home/$USER/Local/appdata it will"
    echo "link to /home/$USER, if the DIR argument is /home/$USER/Local/rootdata it will"
    echo "link to /."
    echo ""
    echo "OPTIONS"
    echo "-d, --dry-run         Don't link or move files."
    echo "-h, --help            Show this help."
}

DRY_RUN=false

# parse options
while true; do
    if [ "$1" = "--dry-run" ] || [ "$1" = "-d" ]; then
        DRY_RUN=true
        shift 1
    elif [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
        help
        exit 0
    else
        break
    fi
done

ORIGINAL_USER=${SUDO_USER:-$USER}
USER_HOME=$(getent passwd "$ORIGINAL_USER" | cut -d: -f6)

APPDATA_FOLDER=$USER_HOME/Local/appdata
ROOTDATA_FOLDER=$USER_HOME/Local/rootdata

SOURCE_DIR=$(readlink -f "$1")
IGNORE_FILE=".ignore"
IGNORE_FILE_PATH="$SOURCE_DIR/$IGNORE_FILE"
IS_ROOTDATA=false

if [[ "$SOURCE_DIR" == "$APPDATA_FOLDER" ]]; then
    DEST_DIR="$USER_HOME"
elif [[ "$SOURCE_DIR" == "$ROOTDATA_FOLDER" ]]; then
    DEST_DIR="/"
    IS_ROOTDATA=true
else
    echo "Can only run $(basename "$0") from $APPDATA_FOLDER or $ROOTDATA_FOLDER"
    exit 1
fi

read_ignore_list

echo "Start relinking files from $SOURCE_DIR to $DEST_DIR"
echo "User: $ORIGINAL_USER"
echo "Destination is: $DEST_DIR"
echo "Is root data: $IS_ROOTDATA"
echo "Perform dry-run: $DRY_RUN"
echo "These items will not be linked $(printf "'%s', " "${IGNORE_LIST[@]}" | sed 's/,$//')"
echo "Add files/folder to $IGNORE_FILE_PATH to ignore them."

traverse_directory "$SOURCE_DIR"