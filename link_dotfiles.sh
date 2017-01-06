#!/bin/bash
echo "Linking files:"
for FILE in $(ls -a /Users/manny/dotfiles)
do
	 ln -sfF /Users/manny/dotfiles/$FILE /Users/manny/$FILE	
done
