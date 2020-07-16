#!/bin/bash

#----------------------------------------------
# Init script for newly installed Ubuntu
#---------------------------------------------

git clone https://github.com/zchrissirhcz ~/.my_config

# files
ln -s ~/.my_config/home/.condarc ~/.condarc
ln -s ~/.my_config/home/.gdbinit ~/.gdbinit
ln -s ~/.my_config/home/.gitconfig ~/.gitconfig
ln -s ~/.my_config/home/.gitmessage ~/.gitmessage
ln -s ~/.my_config/home/.tmux.conf ~/.tmux.conf
ln -s ~/.my_config/home/.zshrc ~/.zshrc
ln -s ~/.my_config/home/.emacs ~/.emacs

# folders
ln -s ~/.my_config/home/.cgdb ~/.cgdb
ln -s ~/.my_config/home/.pip ~/.pip
ln -s ~/.my_config/home/.zsh ~/.zsh
ln -s ~/.my_config/home/.gradle ~/.gradle
ln -s ~/.my_config/home/.emacs.d ~/.emacs.d
ln -s ~/.my_config/home/.config/terminator ~/.config/terminator

ln -s ~/.my_config/dotvim ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

