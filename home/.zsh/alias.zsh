# clean screen
alias cl='clear'

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

alias gdb='gdb -q'

alias weather='curl -s http://wttr.in/\?m | head -n-1'

# list absolute path
alias lsabs='readlink -f'
