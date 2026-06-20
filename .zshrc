#!/data/data/com.termux/files/usr/bin/zsh
# uncomment to profile prompt startup
# zmodload zsh/zprof

# ZSH Theme
eval "$(starship init zsh)"
export STARSHIP_CACHE=~/.config/starship/cache

# makes - and _ interchangable
HYPHEN_INSENSITIVE="true"

# Dont ask about omz update
DISABLE_UPDATE_PROMPT="true"

# auto update
export UPDATE_ZSH_DAYS=400

# show dots while processing
COMPLETION_WAITING_DOTS="true"

# speed up git when repo is large
DISABLE_UNTRACKED_FILES_DIRTY="true"

# do not save duplicates in zsh history
setopt hist_ignore_all_dups

# how date in history is showed
HIST_STAMPS="mm/dd/yyyy"

# where is keep my custom stuff/scripts
ZSH_CUSTOM="$HOME/z-stuff"

zstyle ':completion:*:complete:(cd|pushd):*' tag-order 'local-directories named-directories'

# antidote plugin manager
source "$HOME/.antidote/antidote.zsh"
antidote load "$ZSH_CUSTOM/.zsh_plugins.txt"

# editor languange
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Use vim as default editor
export EDITOR='vim'
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
fi

# my local zsh control file
source "$ZSH_CUSTOM/zsh.local"

# uncomment to end zsh debugging
# zprof
