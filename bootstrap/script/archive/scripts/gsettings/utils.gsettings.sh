function append_to_list() {
    echo "$(echo "$1" | sed 's/.$//'), $2]"
}