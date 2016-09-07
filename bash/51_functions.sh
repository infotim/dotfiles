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
