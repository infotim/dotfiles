function j () {
    cd $(fd --type d "${1:-.}" ~/src | fzf -1 --height=10)
}

function jc () {
    code $(fd --type d "${1:-.}" ~/src | fzf -1 --height=10)
}