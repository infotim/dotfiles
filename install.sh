#!/bin/bash
set -euo pipefail
IFS=$'\n\t'


DOTFILES=$(dirname $(readlink -e ${BASH_SOURCE[0]}))


function make:dir () {
    mkdir -p "${HOME}/${1}"
}


function make:link () {
    local SRC="${DOTFILES}/${1}"
    local DST="${HOME}/${2}"
    ln -snf "${SRC}" "${DST}"
}


function setup:vim () {
    make:dir    .vim
    make:link        vim/vimrc      .vim/
    make:link        vim/ftplugin   .vim/
    make:link        vim/snippets   .vim/

    local SRC="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    local DST="${HOME}/.vim/autoload/plug.vim"
    curl --silent --fail --location\
         --create-dirs --output "${DST}"\
         "${SRC}"
    vim -e +PlugInstall +qa 2>/dev/null || true
}


function main () {
    cd "${DOTFILES}"

    make:dir .config
    make:dir .local/bin

    make:link bash           .bash
    make:link bash_profile   .bash_profile
    make:link bashrc         .bashrc
    make:link bc             .config/
    make:link dircolors      .config/
    make:link firejail       .config/
    make:link fonts          .fonts
    make:link git            .config/
    make:link tmux.conf      .tmux.conf
    make:link x/resources    .Xresources

    setup:vim
}

main
