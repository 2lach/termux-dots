# Setup fzf
# ---------
if [[ ! "$PATH" == */data/data/com.termux/files/home/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/data/data/com.termux/files/home/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/data/data/com.termux/files/home/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/data/data/com.termux/files/home/.fzf/shell/key-bindings.zsh"
