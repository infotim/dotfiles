hack () {
    local hack_dir="${HOME}/stc/hack/${1}"
    if ! [[ -d $hack_dir ]]; then
        mkdir -p "${hack_dir}"
        git -C "${hack_dir}" init
    fi
    cd "${hack_dir}" || exit
}
