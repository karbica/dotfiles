# once, twice, thrice, quartz, quince, sago, septist, occultist, novelist, dentist

# git support (mac)
command -v brew &> /dev/null
[ $? -eq 0 ] && \
[ -d $(brew --prefix)/etc/bash_completion.d ] && \
source $(brew --prefix)/etc/bash_completion.d/git-completion.bash && \
source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh

# git support (linux)
[ -f /usr/share/bash-completion/completions/git ] && \
[ -f /etc/bash_completion.d/git-prompt ] && \
source /usr/share/bash-completion/completions/git && \
source /etc/bash_completion.d/git-prompt

# prompt
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM=verbose
export GIT_PS1_DESCRIBE_STYLE=branch
export GIT_PS1_SHOWCOLORHINTS=1
export PROMPT_COMMAND='__git_ps1 "\n\u@\h:\w" "\n\\\$ "'

# default editor
export EDITOR=/usr/local/bin/nvim

# blocksize
export BLOCKSIZE=1k

# path
export PATH=$PATH:.

# bash
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias ls='ls -lghFG'
alias ll='ls -laghFG'
alias c='clear'
alias ..='cd ..'
alias ...='cd ../..'

# grep
alias g='grep -n'
alias grep='grep -n'
export GREP_OPTIONS='--color=auto'

# networking
alias myip='curl ipinfo.io -w "\n"'
alias netcons='lsof -i'
alias openports='sudo lsof -i | grep LISTEN'

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# yarn
export PATH="$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin"

# go
export GOPATH="$HOME/go"
export GO111MODULE="auto"
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"
