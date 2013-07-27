#!/bin/bash

DOT_FILES=( vimrc gemrc gitconfig gitignore bash_aliases bash_adding )

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/.$file
done

# adding .bashrc
echo '

if [ -f ~/.bash_adding ]; then
  . "$HOME/.bash_adding"
fi' >> $HOME/.bashrc 

# Install NeoBundle
if [ ! -d ~/.vim/bundle/neobundle.vim ]; then
  mkdir -p ~/.vim/bundle
  git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi
