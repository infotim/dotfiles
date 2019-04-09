function j () {
    cd $(fd --type d "${1:-.}" ~/src | fzf -1 --height=10)
}

function jc () {
    cd $(fd --type d "${1:-.}" ~/src | fzf -1 --height=10)
    code .
}

function jb () {
    local branches=$(git for-each-ref --sort=-committerdate refs/heads/ --format='%(refname:short)')
    local branch=$(echo "${branches}" | fzf -1 --height=10)
    git checkout -q ${branch}
}