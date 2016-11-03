function psql () {
    if [[ $# -eq 0 ]]; then
        command psql -h ::1 -U postgres postgres
    else
        command psql "$@"
    fi
}
