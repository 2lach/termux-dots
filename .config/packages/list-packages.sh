#!/bin/bash

mkdir "$(date '+%Y-%m-%d')"

pkg list-installed > pkg-installed.txt
npm list -g --depth=0 > npm-packages.txt
pip freeze > pip-packages.txt
gem list --local > gem-packages.txt

mv *-packages.txt "$(date '+%Y-%m-%d')"