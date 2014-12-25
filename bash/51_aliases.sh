alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'

alias df='df -h'
alias du='du -h'

alias ack='ack-grep --color'
alias ack-grep='ack-grep --color'
alias egrep='egrep --color=auto'
alias grep='grep --color=auto'

alias ..='cd ..'
alias ...='cd ../..'
alias -- -='cd -'

alias @='ssh'

alias ppj='python -mjson.tool'

if [ -r ~/.bash_aliases.local ]; then
    source ~/.bash_aliases.local
fi
