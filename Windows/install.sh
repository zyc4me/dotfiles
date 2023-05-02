#!/bin/bash

# git config --local core.autocrlf false

cp _vimrc ~/_vimrc

mkdir -p ~/.vim/color
cp onedark.vim ~/.vim/color/
cp molokai.vim ~/.vim/color/

mkdir -p ~/.vim/temp_dirs/undodir

echo "OK"

