function j () {
    cd $(fd --type d "${1:-.}" ~/src | fzf -1 --height=10)
}

function jc () {
    cd $(fd --type d "${1:-.}" ~/src | fzf -1 --height=10)
    code .
}
