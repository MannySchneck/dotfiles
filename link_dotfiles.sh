#!/bin/bash
echo "Linking files:"
for FILE in $(ls -a $HOME/dotfiles)
do
    if [[ "$FILE" != "link_dotfiles.sh" && "$FILE" != ".git" && "$FILE" != ".." && "$FILE" != "." ]]
       then
       ln -sfFv $HOME/dotfiles/$FILE $HOME/$FILE
    fi
done
