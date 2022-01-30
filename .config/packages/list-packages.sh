#!/bin/bash

# mkdir "$(date '+%Y-%m-%d')"

pkg list-installed > pkg.txt
sed "s/[/].*//" pkg.txt > pkg-packages.txt
rm -rf pkg.txt
npm list -g --depth=0 > npm-packages.txt
pip freeze > pip-packages.txt
gem list --local > gem-packages.txt

# mv *-packages.txt "$(date '+%Y-%m-%d')"