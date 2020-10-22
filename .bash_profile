# path
export PATH=$PATH:.

# blocksize
export BLOCKSIZE=1k

# fs
alias ls="\ls -G"
alias ll="\ls -Gl"
alias la="\ls -Gla"
alias ..="\cd .."
alias ...="\cd ../.."
alias ....="\cd ../../.."
alias df='\df -hT'
alias du='\du -h'

# grep
alias g="\grep -n"
alias grep="\grep -n"
export GREP_OPTIONS="--color=auto"

# network
alias myip="curl ifconfig.co/json"
alias p="ping"
alias n="nslookup"
alias d="dig"
alias ssh="\ssh -v"
alias netcons='lsof -i'
alias openports='sudo lsof -i | grep LISTEN'

# shortcuts
alias c="clear"

# tldr
function tldr {
    curl cheat.sh/"$1"
}

# wttr
function wttr {
    curl wttr.in/"$1"
}

# go
# https://golang.org/
export GOPATH="$HOME/go"
export GO111MODULE="auto"
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"

# volta
# https://volta.sh/
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
