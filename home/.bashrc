#----------
# => history
#----------

# share history between different terminals
shopt -s histappend
PROMPT_COMMAND=\"history -a; \$PROMPT_COMMAND\"


#----------
# => alias
#----------

# Load pre-defined aliases file here
source ~/.aliasrc

# You can also put each single aliases here
# e.g.
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias emacs='emacs -nw'


#----------
# => PATH
#----------

# Please put PATH, LD_LIBRARY_PATH, Conda, related stuffs in ~/.pathrc

if [ -f ~/.pathrc ]; then
    . ~/.pathrc
fi