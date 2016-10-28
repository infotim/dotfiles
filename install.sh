#!/bin/bash
set -euo pipefail
IFS=$'\n\t'


DOTFILES=$(dirname $(readlink -f ${BASH_SOURCE[0]}))


function make:clean (){
    find ${HOME} -type l -print0 |
        while IFS= read -r -d $'\0' file; do
            if [[ $(readlink -f ${file}) == ${DOTFILES}* ]]; then
                rm -f ${file}
            fi
        done
}


function make:dir () {
    for d in "$@"; do
        mkdir -p "${HOME}/${d}"
    done
}


function make:link () {
    local src="${DOTFILES}/${1}"
    local dst="${HOME}/${2}"
    ln -snf "${src}" "${dst}"
}


function setup:vim () {
    make:dir    .vim
    make:link   vim/vimrc       .vim/
    make:link   vim/ftplugin    .vim/
    make:link   vim/snippets    .vim/

    local src="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    local dst="${HOME}/.vim/autoload/plug.vim"
    curl --silent --fail --location\
         --create-dirs --output "${dst}"\
         "${src}"
    vim -e +PlugInstall +qa 2>/dev/null || true
}


function main () {
    cd "${DOTFILES}"
    make:clean
    ln -snf /dev/null "${HOME}/.xsession-errors"

    make:dir .cache .config .local/bin

    make:link bash          .config/
    make:link bash/bashrc   .bashrc
    make:link bc            .config/
    make:link firejail      .config/
    make:link fonts         .fonts
    make:link git           .config/
    make:link inputrc       .config/
    make:link profile       .profile
    make:link tmux.conf     .tmux.conf
    make:link x/resources   .Xresources

    setup:vim
}

main
