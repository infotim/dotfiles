alias ls='ls --color=auto'
alias ll='ls -l'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'

alias ..='cd ..'
alias ...='cd ../..'
alias -- -='cd -'

alias ppj='python -mjson.tool'

if [ -r ~/.bash_aliases.local ]; then
    source ~/.bash_aliases.local
fi
