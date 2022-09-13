# Zsh loads these files in the following order:
# .zshenv - Contains the user's environment variables.
# .zprofile - Executes commands just before logging in.
# .zshrc - Used for shell configuration and also executes commands.
# .zlogin - Same as `.zprofile` but read after `.zshrc`.
# .zlogout - Executes commands when the shell exits.

# ╭─────╮
# │ XDG │
# ╰─────╯

# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
# https://wiki.archlinux.org/title/XDG_Base_Directory
export XDG_CONFIG_HOME XDG_STATE_HOME
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share
export XDG_STATE_HOME=~/.local/state

# reset
unalias -m "*"

# function paths
fpath=(~/.zsh "$XDG_DATA_HOME/zsh/pure" $fpath)

# ╭─────────────╮
# │ COMPLETIONS │
# ╰─────────────╯

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

# https://stackoverflow.com/a/26479426
zstyle ':completion:*:*:git:*' script $XDG_DATA_HOME/zsh/git-completion.bash
autoload -Uz compinit && compinit -d "$XDG_CACHE_HOME/zsh/.zcompdump"

# ╭────────╮
# │ PROMPT │
# ╰────────╯

# https://github.com/sindresorhus/pure
autoload -Uz promptinit && promptinit
zstyle :prompt:pure:git:stash show yes
prompt pure

# ╭────────────╮
# │ PARAMETERS │
# ╰────────────╯

# https://zsh.sourceforge.io/Doc/Release/Parameters.html
HISTFILE="$XDG_STATE_HOME/zsh/.zhistory"
HISTSIZE=100000
SAVEHIST=100000

# ╭─────────╮
# │ OPTIONS │
# ╰─────────╯

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

# editors
export EDITOR="nvim"
export VISUAL="nvim"

# gnu
# https://www.gnu.org/software/coreutils/manual/html_node/Block-size.html
export BLOCKSIZE=1k

# ╭─────────╮
# │ ALIASES │
# ╰─────────╯

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
alias ssh="\ssh -v"

# terminal
alias c="\clear"

# ╭──────────────╮
# │ TOOLS & LANG │
# ╰──────────────╯

# https://golang.org/
export GOPATH="$HOME/dev/.go"
export GO111MODULE="auto"
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"

# https://volta.sh/
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# https://doc.rust-lang.org/cargo/reference/environment-variables.html
if [[ -d "$HOME/.cargo" ]]; then
	source "$HOME/.cargo/env"
else
	true
fi

# ╭─────────────────────╮
# │ FUNCTIONS & SCRIPTS │
# ╰─────────────────────╯

# show process id by listening port
function lsport {
  lsof -i:"$1"
}

# get cheat sheet of some command
function tldr {
  curl cheat.sh/"$1"
}

# get weather forecast
function wttr {
  curl wttr.in/"$1"
}

# search and invoke command from history through fzf
function fh {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

# ╭──────────────╮
# │ LOCAL SOURCE │
# ╰──────────────╯

# local env vars file (not tracked in git)
if [[ -f "$HOME/.zshrc.local" ]]; then
  source "$HOME/.zshrc.local" 
else
  true
fi
