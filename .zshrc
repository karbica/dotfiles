#!/usr/bin/env zsh

# reset
unalias -m "*"

# prompt
fpath+=("$HOME/.zsh/pure")
autoload -U promptinit; promptinit
prompt pure

# globals
export INFURA_KEY=""

# ls
alias ls="\ls -G"
alias ll="\ls -Gl"
alias la="\ls -Gla"
alias ..="\cd .."
alias ...="\cd ../.."
alias ....="\cd ../../.."

# grep
alias g="\grep --color=auto"
alias grep="\grep --color=auto"

# network
alias myip="curl ifconfig.co/json"
alias p="ping"
alias n="nslookup"
alias d="dig"
alias ssh="\ssh -v"

# fs
alias df='\df -hT'
alias du='\du -h'

# shortcuts
alias c="clear"
alias code="code-insiders"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
