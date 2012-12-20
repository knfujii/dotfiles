#!/bin/bash

DOT_FILES=( vimrc gemrc gitconfig gitignore bash_aliases bash_adding )

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/.$file
done

ln -s $HOME/dotfiles/vimfiles/ $HOME/.vim

echo '. "$HOME/.bash_adding"' >> $HOME/.bashrc
