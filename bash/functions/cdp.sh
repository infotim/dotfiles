function _cdp () {
    local ROOT="${HOME}/src"
    local CUR=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=($(\
        find $ROOT -type d -name .git -printf "%h\n"\
        | cut -d/ -f5-\
        | grep -i "$CUR"
    ))
}

function cdp () {
    cd "${HOME}/src/${1}"
}

complete -F _cdp cdp
