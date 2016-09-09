function g.clone () {
    test -z $1 && echo 'Nothing to do' && return

    local PROJ REPO
    IFS=/ read PROJ REPO <<< $1

    mkdir -p ~/src/${PROJ}
    cd ~/src/${PROJ}

    git clone ssh://git@stash.bank24.int:7999/${PROJ}/${REPO}.git && cd $REPO
}

function g.project () {
    local REPO_ROOT=~/src
    local REPO_LIST

    for x in $(find ${REPO_ROOT} -name .git -type d); do
        local CONF="${x}/config"
        if [ -r $CONF ]; then
            grep -q ${1:-"@stash.bank24.int"} $CONF
            if [ $? -eq 0 ]; then
                REPO_LIST+=($(dirname $x | cut -d/ -f5-))
            fi
        fi
    done

    array::prompt REPO_LIST[@]
    array::choose REPO_LIST[@]
    cd ${REPO_ROOT}/${REPO_LIST[$?]}
}
