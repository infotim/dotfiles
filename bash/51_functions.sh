function = () {
    echo $* | bc -q
}

function bashrc::set_local() {
    local ALIASES=($(hostname --fqdn) $(hostname --domain))
    for x in "${ALIASES[@]}"; do
        local FILE="~/.bash/${x}_${1}"
        test -r $FILE && source $FILE || true
    done
}
bashrc::set_local functions

function array::choose () {
    declare -a ARRAY=("${!1}")
    declare -i INDEX=$(( ${#ARRAY[@]}+1 ))

    while [ -z ${ARRAY[$INDEX]} ]; do
        read -p "Choose: " INDEX
    done
    return $INDEX
}

function array::prompt () {
    declare -a ARRAY=("${!1}")
    for x in "${!ARRAY[@]}"; do
        echo -e "${x}\t${ARRAY[$x]}"
    done
}

function _cdl () {
    local CUR=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=($(\
        find $MY_SITE_PACKAGES -maxdepth 2 -name PKG-INFO -o -name METADATA\
        | perl -lnwe 'm!/(\w+)-\d+!&&print $1'\
        | grep -i "$CUR"
    ))
}
function cdl () {
    local PATH=${MY_SITE_PACKAGES}/${1}
    test -d $PATH && cd $PATH
    test -f ${PATH}.py && $EDITOR ${PATH}.py
}
complete -F _cdl cdl


function _cdp () {
    local ROOT=~/src
    local CUR=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=($(\
        find $ROOT -type d -name .git -printf "%h\n"\
        | cut -d/ -f5-\
        | grep -i "$CUR"
    ))
}
function cdp () {
    cd ~/src/${1}
}
complete -F _cdp cdp


function mkpackage () {
    mkdir -p "${1}"
    touch "${1}/__init__.py"
}
