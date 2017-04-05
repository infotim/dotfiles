shellcheck () {
    if [[ $# = 0 ]]; then
        find . -type f -executable -not -path './.git/*' -print0 | xargs -0 "$(which shellcheck)"
    else
        command shellcheck "$@"
    fi
}
