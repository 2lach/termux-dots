#!/data/data/com.termux/files/usr/bin/zsh
# -X Don't clear after exit
# export MANPAGER="less -X --use-color -Dd+r -Du+b"

export MANPAGER="less -X"
man() {
local red="\e[0;91m"
local yellow="\e[01;93m"
local blue="\e[0;94m" # purple
local pink="\e[01;95m" # pink
local cyan="\e[01;96m" # cyan

local expand_bg="\e[K"
local blue_bg="\e[0;104m${expand_bg}"
local red_bg="\e[0;101m${expand_bg}"
local green_bg="\e[0;102m${expand_bg}"

local green="\e[0;92m"
local white="\e[0;97m"
local bold="\e[1m"
local uline="\e[4m"
local reset="\e[0m"

# Blue
LESS_TERMCAP_md=$'\e[01;96m' \
LESS_TERMCAP_me=$'\e[0m' \
LESS_TERMCAP_se=$'\e[4;0m' \
LESS_TERMCAP_so=$'\e[1;92m' \
LESS_TERMCAP_ue=$'\e[1;92;0m' \
LESS_TERMCAP_us=$'\e[1;94m' \
command man "$@"
}
