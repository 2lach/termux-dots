# uncomment to profile prompt startup with zprof
# zmodload zsh/zprof

# paths live in
# /data/data/com.termux/files/home/.zshenv
#
# export ZSH=$HOME/.oh-my-zsh
# export XDG_CONFIG_HOME="$HOME/.config"
# export HISTFILE="$HOME/.config/zsh/.zsh_history"
# export ZSH_COMPDUMP="$HOME/.config/zsh/.zcompdump"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# eval "$(starship init zsh)"
# ZSH_THEME="refined"
# ZSH_THEME="avit"
# ZSH_THEME="agnoster"
# ZSH_THEME="mgutz"
# ZSH_THEME="random" 

# Uncomment to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeabl
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting
DISABLE_UPDATE_PROMPT="true"

# update interwall 
# omz update also included in system_update
export UPDATE_ZSH_DAYS=400


# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"

# custom folder
ZSH_CUSTOM="$HOME/z-stuff"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(web-search z fd zsh-syntax-highlighting common-aliases gh)

source $ZSH/oh-my-zsh.sh

# User configuration

# set language environment
export LANG=en_US.UTF-8

export EDITOR='vim'

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# personal aliases, functions, scripts and stuff are managed in:
source "$ZSH_CUSTOM/zsh.local"
				
# For a full list of active aliases, run `alias`.

# cod completion daemon
source <(cod init $$ zsh)

# starship prompt (spaceship but in rust)
eval "$(starship init zsh)"

# lazy load bitwarden cli completion 
bw() {
    unset -f bw
		eval "$(bw completion --shell zsh); compdef _bw bw;"
		bw "$@"
}

# netlify completion
# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

# uncomment to finish profiling
# zprof
