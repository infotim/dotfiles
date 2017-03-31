docker () {
    if [[ $# -eq 0 ]]; then
        command docker "$@"
        return
    fi

    local cmd="_docker_${1}"
    if [[ $(type -t "${cmd}") == "function" ]]; then
        shift
        $cmd "$@"
        return
    else
        command docker "$@"
    fi
}

_docker_purge () {
    docker ps -qf status=exited | xargs -r docker rm
    docker images | awk '$1=="<none>"&&$2=="<none>"{print $3}' | xargs -r docker rmi
}
