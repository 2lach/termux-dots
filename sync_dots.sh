#!/bin/bash

# exit on error
# set -e

function sync() {
  cp -r "$HOME/$1" .
}

# Folders

declare -a folders=(".config" ".termux" "z-stuff/plugins" "z-stuff/scripts" "z-stuff/completions" "z-stuff/notes")

for i in "${folders[@]}"; do
  echo "syncing folder: $i"
  sync "$i"
done

declare -a files=(".gitconfig" ".hushlogin" "z-stuff/books2022.txt" "z-stuff/paths.sh" "z-stuff/zsh.local")

for i in "${files[@]}"; do
  echo "sync files: $i"
  sync "$i"
done

echo 'sync completed'
