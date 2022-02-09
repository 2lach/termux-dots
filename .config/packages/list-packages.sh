#!/bin/bash

# mkdir "$(date '+%Y-%m-%d')"
pkg list-installed | sed "s/[/].*//" >pkg-packages.txt
exa /data/data/com.termux/files/usr/lib/node_modules/ >npm-packages.txt
pip list --format=freeze | grep --color -v '^\-e' | cut -d = -f 1 >pip-packages.txt
gem list >gem-packages.txt

# mv *-packages.txt "$(date '+%Y-%m-%d')"