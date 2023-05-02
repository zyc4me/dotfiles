#!/bin/bash

# git config --local core.autocrlf false

cp _vimrc ~/_vimrc

mkdir -p ~/.vim/colors
cp colors/* ~/.vim/colors/

mkdir -p ~/.vim/temp_dirs/undodir

echo "vim OK"

#----------
NVIM_CFG_DIR=~/AppData/Local/nvim
mkdir -p $NVIM_CFG_DIR
cp nvim/init.lua $NVIM_CFG_DIR/init.lua

mkdir -p $NVIM_CFG_DIR/colors
cp colors/* $NVIM_CFG_DIR/colors/

mkdir -p $NVIM_CFG_DIR/temp_dirs/undodir

echo "nvim OK"



