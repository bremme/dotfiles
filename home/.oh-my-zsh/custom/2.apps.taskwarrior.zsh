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

function _task_to_someday() {
    task $@ modify -in +someday -next
}

function _task_to_next() {
    task $@ modify -in -someday +next
}

function _task_search() {
    task "$@" ls
}

function _task_search_project() {
    task project:"$@" ls
}

function _task_search_tag() {
    task "+$1" ls
}

function _task_mod_description() {
    task "$1" mod description:"$2"
}

function _task_mod_depends() {
    task "$1" mod depends:"$2"
}

alias t="task"                      # run taskwarrior

alias in="task add +in"             # add to inbox
alias inread="_inread"              # add book to in list
alias inbook="_inbook"

alias tin="task in"                 # show inbox
alias tsom="task +someday ls"       # show someday

alias tmd="_task_mod_description"   # Modify description
alias tmdep="_task_mod_depends"     # Modify depends

alias tos="_task_to_someday"        # move to someday list
alias ton="_task_to_next"           # move to next list

alias ts="_task_search"             # search for tasks
alias tsp="_task_search_project"    # search for projects
alias tst="_task_search_tag"        # search for tags