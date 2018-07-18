# once, twice, thrice, quartz, quince, sago, septist, occultist, novelist, dentist

# prompt
export PS1="\n\w\n\$ "

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
alias grep='grep -n'
export GREP_OPTIONS='--color=auto'

# git
git config --global color.ui true
git config --global format.pretty oneline
git config --global core.fileMode true
git config --global core.ignorecase true

# networking
alias myip='curl ipinfo.io -w "\n"'
alias netcons='lsof -i'
alias openports='sudo lsof -i | grep LISTEN'

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
