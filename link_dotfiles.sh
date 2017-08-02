#!/bin/bash
echo "Linking files:"
for FILE in $(ls -a $HOME/dotfiles)
do
	ln -sfFv $HOME/dotfiles/$FILE $HOME/$FILE	
done
