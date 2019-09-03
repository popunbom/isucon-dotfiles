#!/bin/bash


git clone "https://github.com/popunbom/isucon-dotfiles" ~/.dotfiles

for dotfile in $(find ~/.dotfiles -maxdepth 1 -type f -name ".*" | sed -E "s#$HOME/.dotfiles/(.*)#\1#g"); do
  echo "ln -s ~/.dotfiles/${dotfile} ~/${dotfile}"
done
