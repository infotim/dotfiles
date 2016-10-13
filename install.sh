#!/bin/bash
set -e

cd $(dirname $(readlink -e ${BASH_SOURCE[0]}))

function msg () {
    echo
    echo $@
}

function symlink () {
    local SRC=$(readlink -e "${1}")
    local DST="${2}"
    if [ -L $DST ]; then
        printf "%-35s %s\n" ${DST} "${1}";
    else
        ln -s "${SRC}" "${DST}";
    fi
}

function install_vim_plug (){
    local SRC="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    local DST="${HOME}/.vim/autoload/plug.vim"

    msg "Installing vim-plug..."

    curl --silent --fail --location --output "${DST}" "${SRC}"
    vim -e +PlugInstall +qa
}


mkdir -p "${HOME}/.config"
mkdir -p "${HOME}/.vim/autoload"
mkdir -p "${HOME}/.vim/ftplugin"


symlink     .                       "${HOME}/.dotfiles"
symlink     .fonts                  "${HOME}/.fonts"
symlink     bash                    "${HOME}/.bash"
symlink     bash_profile            "${HOME}/.bash_profile"
symlink     bashrc                  "${HOME}/.bashrc"
symlink     dircolors               "${HOME}/.dircolors"
symlink     firejail                "${HOME}/.config/firejail"
symlink     git/config              "${HOME}/.gitconfig"
symlink     git/ignore              "${HOME}/.gitignore_global"
symlink     tmux.conf               "${HOME}/.tmux.conf"
symlink     vim/config              "${HOME}/.vimrc"
symlink     vim/ftplugin/python.vim "${HOME}/.vim/ftplugin/"
symlink     x/resources             "${HOME}/.Xresources"

install_vim_plug
