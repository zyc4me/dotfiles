#!/bin/bash

#----------------------------------------------
# Init script for newly installed Ubuntu
#---------------------------------------------

set -e

function git_clone()
{
    if [ ! -d ~/.my_config ]; then
        git clone https://github.com/zchrissirhcz/dotfiles ~/.my_config
    fi
    echo "-- git clone OK"
}

function link_file()
{
    SRC_FILE=$1
    DST_FILE=$2
    if [ ! -f $DST_FILE ]; then
        ln -s $SRC_FILE $DST_FILE
    else
        echo $DST_FILE "already exist, skip linking"
    fi
}


# files
function link_file_list()
{
    link_file -s ~/.my_config/home/.condarc ~/.condarc
    link_file -s ~/.my_config/home/.gdbinit ~/.gdbinit
    link_file -s ~/.my_config/home/.gitconfig ~/.gitconfig
    link_file -s ~/.my_config/home/.gitmessage ~/.gitmessage
    link_file -s ~/.my_config/home/.tmux.conf ~/.tmux.conf
    link_file -s ~/.my_config/home/.zshrc ~/.zshrc
    link_file -s ~/.my_config/home/.emacs ~/.emacs
    link_file -s ~/.my_config/home/.aliasrc ~/.aliasrc
    echo "-- link files OK"
}

#--------------------
# usage:
# link_directory SRC_DIR DST_DIR
# which makes DST_DIR -> SRC_DIR
#--------------------
function link_directory()
{
    SRC_DIR=$1
    DST_DIR=$2
    if [ ! -d $DST_DIR ]; then
        ln -s $SRC_DIR $DST_DIR
    else
        echo $DST_DIR "already exist, skip linking"
    fi
}

# folders
function link_directory_list()
{
    link_directory ~/.my_config/home/.cgdb ~/.cgdb
    link_directory ~/.my_config/home/.pip ~/.pip
    link_directory -s ~/.my_config/home/.zsh ~/.zsh
    link_directory -s ~/.my_config/home/.gradle ~/.gradle
    link_directory -s ~/.my_config/home/.emacs.d ~/.emacs.d
    link_directory -s ~/.my_config/home/.config/terminator ~/.config/terminator

    link_directory -s ~/.my_config/dotvim ~/.vim_runtime
    sh ~/.vim_runtime/install_awesome_vimrc.sh

    echo "-- link directories OK"
}

# pathrc
function remind_pathrc()
{
    echo "Please create ~/.pathrc and put PATH related stuffs inside :-)"
}

function hello()
{
    echo "------------------------------------------"
    echo ""
    echo "      Welcome to use ChrisZZ's Config"
    echo ""
    echo "------------------------------------------"
}

function main()
{
    hello
    git_clone
    link_directory_list
    link_file_list
    remind_pathrc
}

main
