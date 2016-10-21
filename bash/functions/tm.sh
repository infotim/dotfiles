function _tm () {
    local root="${HOME}/src"
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=($(\
        find $root -type d -name .git -printf "%h\n"\
        | cut -d/ -f5-\
        | grep -i "$cur"
    ))
}

function tm () {
    local path="${HOME}/src/${1}"

    if [[ $# -eq 0 ]]; then
        tmux attach -t 0 || tmux

    elif [[ $# -eq 1 && -d "${path}" ]]; then
        local session_name=${1/./_}  # tmux does not allow dot in session name
        tmux attach-session -t "${session_name}"\
        || tmux new-session -c "${path}" -s "${session_name}"

    else
        tmux "$@"
    fi
}

complete -F _tm tm
