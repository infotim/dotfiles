function cds () {
    cd $(fd --type d "${1:-.}" ~/src | fzf -1 --height=10)
}