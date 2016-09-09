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
