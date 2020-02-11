# reset
unalias -m "*"

# function paths
fpath=(~/.zsh "$HOME/.zsh/pure" $fpath)

# git completions
# https://github.com/git/git/tree/master/contrib/completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
autoload -Uz compinit ; compinit

# prompt
autoload -Uz promptinit ; promptinit
prompt pure

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
alias g="\grep --color=auto"
alias grep="\grep --color=auto"

# network
alias myip="curl ifconfig.co/json"
alias p="ping"
alias n="nslookup"
alias d="dig"
alias ssh="\ssh -v"

# shortcuts
alias c="clear"
alias code="code-insiders"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
