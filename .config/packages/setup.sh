#!/usr/bin/bash

xargs -n1 pkg install <pkg-packages.txt
xargs -n1 npm install -g <npm-packages.txt
xargs -n1 gem install --global <gem-packages.txt
xargs -n1 pip3 install <pip-packages.txt
