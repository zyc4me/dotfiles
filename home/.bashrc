#----------
# => history
#----------

# share history between different terminals
shopt -s histappend
PROMPT_COMMAND=\"history -a; \$PROMPT_COMMAND\"
