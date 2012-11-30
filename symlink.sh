#!/bin/bash

DOT_FILES=( vimrc bashrc gitconfig gitignore )

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/.$file
done

ln -s $HOME/dotfiles/vimfiles/ $HOME/.vim
