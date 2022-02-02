#!/bin/sh

#----------------------------------------------
# Init script for newly installed Ubuntu
#---------------------------------------------

set -e

git_clone()
{
    if [ ! -d ~/.my_config ]; then
        git clone https://github.com/zchrissirhcz/dotfiles ~/.my_config
    fi
    echo "-- git clone OK"
}

link_file()
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
link_file_list()
{
    link_file  ~/.my_config/home/.condarc ~/.condarc
    link_file  ~/.my_config/home/.gdbinit ~/.gdbinit
    link_file  ~/.my_config/home/.lldbinit ~/.lldbinit
    link_file  ~/.my_config/home/.gitconfig ~/.gitconfig
    link_file  ~/.my_config/home/.gitmessage ~/.gitmessage
    link_file  ~/.my_config/home/.tmux.conf ~/.tmux.conf
    link_file  ~/.my_config/home/.zshrc ~/.zshrc
    link_file  ~/.my_config/home/.npmrc ~/.npmrc
    #link_file  ~/.my_config/home/.emacs ~/.emacs
    link_file  ~/.my_config/home/.aliasrc ~/.aliasrc
    mkdir -p ~/.cargo
    link_file ~/.my_config/home/.cargo/config ~/.cargo/config
    echo "-- link files OK"
}

#--------------------
# usage:
# link_directory SRC_DIR DST_DIR
# which makes DST_DIR -> SRC_DIR
#--------------------
link_directory()
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
link_directory_list()
{
    link_directory ~/.my_config/home/.cgdb ~/.cgdb
    link_directory ~/.my_config/home/.pip ~/.pip
    link_directory ~/.my_config/home/.zsh ~/.zsh
    link_directory ~/.my_config/home/.gradle ~/.gradle
    link_directory ~/.my_config/home/.emacs.d ~/.emacs.d

    mkdir -p ~/.config
    link_directory ~/.my_config/home/.config/terminator ~/.config/terminator
    link_directory ~/.my_config/home/.config/nvim ~/.config/nvim

    link_directory ~/.my_config/dotvim ~/.vim_runtime
    sh ~/.vim_runtime/install_awesome_vimrc.sh
    vim +PlugInstall +qall # https://github.com/borgwang/dotfiles/blob/master/linux-setup.sh

    echo "-- link directories OK"
}

# pathrc
remind_pathrc()
{
    echo "Please create ~/.pathrc and put PATH related stuffs inside :-)"
}

hello()
{
    echo "------------------------------------------"
    echo ""
    echo "      Welcome to use ChrisZZ's Config"
    echo ""
    echo "------------------------------------------"
}

main()
{
    hello
    git_clone
    link_directory_list
    link_file_list
    remind_pathrc
}

main "$@"
