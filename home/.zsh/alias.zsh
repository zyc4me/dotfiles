alias cd=' cd'
alias ls=' ls --color=auto'
alias lsdir='ls -d */' # only list directories
alias ll='ls -al'
alias lspwd='lspwd(){ls `pwd`/$1};lspwd'
alias grep='grep --color=auto'
alias gitst='git st'

# clean screen
alias cl='clear'

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

alias gdb='gdb -q'
alias cgdb='cgdb -q'

alias weather='curl -s http://wttr.in/\?m | head -n-1'

# list absolute path
alias lsabs='readlink -f'
