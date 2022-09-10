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
alias myip="\curl -4 ifconfig.co/json"
alias p="\ping"
alias n="\nslookup"
alias d="\dig"
alias ssh="\ssh -v"

# terminal
alias c="\clear"

# port pid
function lsport {
    lsof -i:"$1"
}

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
export GOPATH="$HOME/dev/.go"
export GO111MODULE="auto"
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"

# volta
# https://volta.sh/

# rust
# https://rust-lang.org
if [[ -d "$HOME/.cargo" ]]; then
    source "$HOME/.cargo/env"
else
    true
fi
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
