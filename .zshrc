# Zsh loads these files in the following order:
# .zshenv - Contains the user's environment variables.
# .zprofile - Executes commands just before logging in.
# .zshrc - Used for shell configuration and also executes commands.
# .zlogin - Same as `.zprofile` but read after `.zshrc`.
# .zlogout - Executes commands when the shell exits.

# reset
unalias -m "*"

# function paths
fpath=(~/.zsh "$HOME/.local/share/zsh/pure" $fpath)

# git completions
# https://github.com/git/git/tree/master/contrib/completion
#
# If you run into ZSH complaining about insecure directories it will be
# because of files being generated by other groups that are not you or root.
# So ZSH must be told about what to do with these files since they are not yours.
# You can run `compaudit` to list the insecure directores and `ls` will show a
# writable permission while being apart of an insecure group.
#
# Running this command will remove the group-writable permission on those directories:
#
# 	chmod g-w /usr/local/share/zsh
# 	chmod g-w /usr/local/share/zsh/site-functions
#
# Or more succinctly if there way more directories:
#
# 	compaudit | xargs chmod g-w
#
# This should take care of the warning every time a new ZSH shell is started.
zstyle ':completion:*:*:git:*' script ~/.local/share/zsh/git-completion.bash
autoload -Uz compinit && compinit

# prompt
# https://github.com/sindresorhus/pure
autoload -Uz promptinit && promptinit
zstyle :prompt:pure:git:stash show yes
prompt pure

# parameters
# https://zsh.sourceforge.io/Doc/Release/Parameters.html
HISTFILE="$XDG_CONFIG_HOME/zsh/.zhistory"
HISTSIZE=10000
SAVEHIST=10000

# options
# https://zsh.sourceforge.io/Doc/Release/Options.html
setopt EXTENDED_GLOB
setopt RM_STAR_SILENT
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY

# base directory specification
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
# https://wiki.archlinux.org/title/XDG_Base_Directory
export XDG_CONFIG_HOME XDG_STATE_HOME
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share

# editors
export EDITOR="nvim"
export VISUAL="nvim"

# gnu
# https://www.gnu.org/software/coreutils/manual/html_node/Block-size.html
export BLOCKSIZE=1k

# man pages
export MANPAGER="nvim +Man!"

# file system
alias l="\ls -G"
alias ls="\ls -G"
alias l="\ls -Gl"
alias ll="\ls -Gl"
alias la="\ls -Gla"
alias ..="\cd .."
alias ...="\cd ../.."
alias ....="\cd ../../.."
alias .....="\cd ../../../.."
alias df='\df -hT'
alias du='\du -h'

# zsh directory stack
# https://thevaluable.dev/zsh-install-configure-mouseless/#zsh-directory-stack
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

# vi mode
# bindkey -v
# export KEYTIMEOUT=1

# grep
alias g="\grep -n"
alias grep="\grep -n"

# network
alias myip="\curl -4 ifconfig.co/json"
alias p="\ping"
alias n="\nslookup"
alias d="\dig"
alias ssh="\ssh -v"

# terminal
alias c="\clear"

# go
# https://golang.org/
export GOPATH="$HOME/dev/.go"
export GO111MODULE="auto"
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"

# volta
# https://volta.sh/
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# rust
# https://doc.rust-lang.org/cargo/reference/environment-variables.html
if [[ -d "$HOME/.cargo" ]]; then
	source "$HOME/.cargo/env"
else
	true
fi

# scripts file for custom functions
if [[ -f "$ZDOTDIR/scripts.zsh" ]]; then
  source "$ZDOTDIR/scripts.zsh" 
else
  true
fi

# local env vars file (not tracked in git)
if [[ -f "$ZDOTDIR/local.zsh" ]]; then
  source "$ZDOTDIR/local.zsh" 
else
  true
fi
