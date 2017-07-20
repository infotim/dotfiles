hack () {
    local root="${HOME}/src/hack/${1}"
    if ! [[ -d ${root} ]]; then
        mkdir -p "${root}"
        git -C "${root}" init
    fi
}

_hack () {
    local root="${HOME}/src/hack"
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=($(\
        find "${root}" -type d -name .git -printf "%h\n"\
        | cut -d/ -f6-\
        | grep -i "${cur}"
    ))
}

complete -F _hack hack
