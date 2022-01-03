#!/bin/bash

# exit on error
# set -e

function sync() {
  cp -r "$HOME/$1" .
}

# Folders

declare -a folders=(".config" ".oh-my-zsh" ".termux" "z-stuff/plugin" "z-stuff/scripts")

for i in "${folders[@]}"; do
  echo "syncing folder: $i"
  sync "$i"
done

declare -a files=(".gitconfig" ".gitignore" ".hushlogin" "z-stuff/books2022.txt" "z-stuff/count-nr-of-read-books.md" "z-stuff/paths.sh" "z-stuff/zsh.local")

for i in "${files[@]}"; do
  echo "sync files: $i"
  sync "$i"
done

echo 'sync completed'
