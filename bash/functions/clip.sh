function clip () {
    local str
    str=$(host "${1}" | awk '/has address/{printf("%s (%s)\n", $1, $4)}')
    if [[ -n $str ]]; then
        echo "${str}" | xclip -selection clipboard
    else
        echo "Can't resolve hostname ${1}" 1>&2
    fi
}
