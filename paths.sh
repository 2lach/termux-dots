##########
# EXPORTS
##########

export PATH=$HOME/bin:/usr/local/bin:$PATH
export HORS_ENGINE=bing

# cod completions learner
export CODPATH="/data/data/com.termux/files/home/go/bin/cod"

export MANPATH="/usr/local/man:$MANPATH"
export GEMPATH=$(gem env gempath)
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$(go env GOPATH)/bin

