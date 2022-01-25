#!/bin/bash
mkdir "$(date)"
pkg list-installed > pkg-installed.txt
npm list -g --depth=0 > npm-packages.txt
pip freeze > pip-packages.txt
gem list --local > gem-packages.txt