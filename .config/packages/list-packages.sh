#!/bin/bash

pkg list-installed > pkg-installed.txt
npm-list-globals > npm-packages.txt
pip freeze > pip-packages.txt
gem list --local > gem-packages.txt