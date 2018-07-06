#!/bin/bash

DOR_FILES=(.vimrc )

for file in ${DOR_FILES[@]}
do
	ln -s $HOME/dotfiles/$file $HOME/$file
	#echo $HOME/dotfiles/$file $HOME/$file
done


