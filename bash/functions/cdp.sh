function _cdp () {
    local root="${HOME}/src"
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=($(\
        find $root -type d -name .git -printf "%h\n"\
        | cut -d/ -f5-\
        | grep -i "$cur"
    ))
}

function cdp () {
    cd "${HOME}/src/${1}"
}

complete -F _cdp cdp
