function = () {
    echo $* | bc -q
}

function bashrc::set_aliases_local() {
    local ALIASES=($(hostname --fqdn) $(hostname --domain))
    for x in "${ALIASES[@]}"; do
        local FILE="~/.bash/${x}_aliases.sh"
        test -r $FILE && source $FILE || true
    done
}
