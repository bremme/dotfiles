function _inread() {
    sub_project="$1"
    task add +in +reading project:read.$sub_project "${@:2}"
}
function _inbook() {
    sub_project="$1"
    title="$2"
    for chapter in 1 2 3 4
    do
        task add +in +reading project:"read.$sub_project" "Lees hoofdstuk $chapter van $title"
    done
}

function _tos() {
    task $@ modify -in -next +someday
}

function _ton() {
    task $@ modify -in -someday +next
}

alias t="task"          # run taskwarrior
alias in="task add +in" # add to in list
alias inread="_inread"  # add book to in list
alias inbook="_inbook"

alias tos="_tos"        # move to someday list
alias ton="_ton"        # move to next list
