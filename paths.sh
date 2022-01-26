##########
# EXPORTS
##########

export PATH=$HOME/bin:/usr/local/bin:$PATH

# cod completions learner
export CODPATH="/data/data/com.termux/files/home/go/bin/cod"

export MANPATH="/usr/local/man:$MANPATH"
export GEMPATH=$(gem env gempath)
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$(go env GOPATH)/bin

# howdoi in rust
export HORS_ENGINE=bing

# todo.txt directory (should be an absolute path)
export TODO_DIR="/data/data/com.termux/files/home/.config/todo/todo.sh"
export TODO_FILE="$TODO_DIR/todo.txt"
export DONE_FILE="$TODO_DIR/done.txt"
export REPORT_FILE="$TODO_DIR/report.txt"
