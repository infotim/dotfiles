function GIT::clone () {
    local PROJ REPO
    IFS=/ read PROJ REPO <<< "$1"

    mkdir -p ~/src/$PROJ
    cd ~/src/$PROJ

    git clone ssh://git@stash.bank24.int:7999/${PROJ}/${REPO}.git && cd $REPO
}
