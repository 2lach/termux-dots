#!/data/data/com.termux/files/usr/bin/bash

# exit on error
# set -e

function sync() {
	cp -r "$HOME/$1" .
}

# Folders

declare -a folders=(".config" ".termux" "z-stuff/plugins" "z-stuff/scripts" "z-stuff/completions" "z-stuff/notes" ".vim")

for i in "${folders[@]}"; do
	echo "syncing folder: $i"
	sync "$i"
done

declare -a files=(".gitconfig" ".zshrc" ".vimrc" ".hushlogin" "z-stuff/books2023.txt" "z-stuff/paths.sh" "z-stuff/zsh.local")

for i in "${files[@]}"; do
	echo "sync files: $i"
	sync "$i"
done

# remove duplicated and uneeded files
rm -rf /data/data/com.termux/files/home/z-stuff/dots/.vim/plugged
rm -rf /data/data/com.termux/files/home/z-stuff/dots/.config/cache
echo ""
echo 'Sync completed' | lolcat
date
