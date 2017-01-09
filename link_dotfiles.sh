#!/bin/bash
echo "Linking files:"
for FILE in $(ls -a /Users/manny/dotfiles)
do
	ln -sfF $HOME/dotfiles/$FILE /Users/manny/$FILE	
done
