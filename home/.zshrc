#----------------------------------------------------------
#
# Z Shell's config file
#
#----------------------------------------------------------


#----------
# => Location
#----------

# Put this file as ~/.zshrc
# 
# Or, export $ZDOTDIR as some directory, and
# put this file in $ZDOTDIR/.zshrc
# This is helpful when debugging and compare two zshrc files


#----------
# => Prompt
#----------
#utoload -Uz promptinit
#promptinit
#prompt adam1 # this removes conda environment name.


#----------
# => History
#----------

# share history among different terminals
setopt histignorealldups sharehistory

# Keep 5000 line of history records
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history


#----------
# => Completion
#----------

# Use modern completion system
autoload -Uz compinit

fpath[1,0]=~/.zsh/completion/
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# cd command with tab selection
zstyle ':completion:*:*:*:default' menu yes select

#----------
# => zplug
#----------
#if [ ! -f "$HOME/.zplug/autoload/zplug" ]; then
#    echo 'zplug not exist. downloading...'
#    git clone https://github.com/zplug/zplug ~/.zplug --depth=1
#fi
#source ~/.zplug/init.zsh


#----------
# => plugins
#----------
# Put plugins here
# zplug romkatv/powerlevel10k, as:theme, depth:1

# Make listed plugins loaded
#zplug load

#source ~/.zplug/repos/romkatv/powerlevel10k/powerlevel10k.zsh-theme

#----------
# => alias
#----------

# Load pre-defined aliases file here
source ~/.zsh/alias.zsh

# You can also put each single aliases here
# e.g.
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias emacs='emacs -nw'



# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

# please build system's complete config
# source <(plz --completion_script)

# ROS
#source /opt/ros/kinetic/setup.zsh

# VIM's lightline
export TERM=xterm-256color


#----------
# => Python
#----------

# Conda
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/zz/soft/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/zz/soft/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/zz/soft/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/zz/soft/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# PYTHONPATH: add the folder where invoke python as sys.path[1]
export PYTHONPATH=:/home/zz/work/caffe-BVLC/python:$PYTHONPATH


#----------
# => PATH
#----------

# This environment variable `PATH` is for finding executable paths
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

#export GOPATH=/home/zz/.go
#export PATH=/home/zz/soft/protobuf-3.6.1/bin:$PATH
export ANDROID_SDK=/home/zz/soft/android-sdk-linux
export ANDROID_NDK=/home/zz/soft/android-ndk-r17b
export ANDROID_NDK_ROOT=$ANDROID_NDK
#export SNPE_ROOT=$HOME/work/snpe-1.20.2
export SNPE_ROOT=$HOME/work/snpe-1.23.1.245


CMAKE=/home/zz/soft/cmake-3.17.2/bin
VIM=/home/zz/soft/vim8/bin
EMACS=$HOME/soft/emacs-26.1/bin

CUDA=/usr/local/cuda10.2/bin
CUDA_LIBDIR=/usr/local/cuda10.2/lib64

OPENCV_LIBDIR=/usr/local/opencv-3.4.5/lib

VALGRIND=/home/zz/soft/valgrind/bin

export PATH=$VIM:$CMAKE:$EMACS:$CUDA:$VALGRIND:$ANDROID_SDK/platform-tools:$PATH


#----------
# => LD_LIBRARY_PATH, LD_PRELOAD
#----------

# These env vars are for customized lib finding path
#export LD_LIBRARY_PATH=/home/zz/soft/protobuf-3.6.x/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$CUDA_LIBDIR:$OPENCV_LIBDIR


