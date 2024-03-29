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

# ╭─────────╮
# │ GLOBALS │
# ╰─────────╯

# reset
unalias -m "*"

# ╭─────────────╮
# │ COMPLETIONS │
# ╰─────────────╯

# zstyle pattern
# :completion:<function>:<completer>:<command>:<argument>:<tag>

# load more completions
fpath=($XDG_DATA_HOME/zsh/zsh-completions $fpath)

# called before compinit
zmodload zsh/complist

# register homebrew completions
if type brew &>/dev/null
then
  fpath=(${HOMEBREW_PREFIX}/share/zsh-completions $fpath)
fi

# load functions and use the cache directory
autoload -Uz compinit && compinit -d "$XDG_CACHE_HOME/zsh/.zcompdump"

# basic completers
zstyle ':completion:*' completer _extensions _complete _approximate

# turn to cache for commands that use it
zstyle ':completion:*' use-cache on
zstyle ':completion::complete:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

# autocomplete options for `cd` instead of directory stack
zstyle ':completion:*' complete-options true

# sorty by modification date
zstyle ':completion:*' file-sort modification

# format completion tags
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d --%f'
zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'

# only display some tags for `cd`
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories

# ordering of groups
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands

# keep the prefix when activating autocomplete
zstyle ':completion:*' keep-prefix true

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
# fpath=($XDG_DATA_HOME/zsh $fpath)
# zstyle ':completion:*:*:git:*' script $XDG_DATA_HOME/zsh/git-completion.zsh

# ╭────────╮
# │ PROMPT │
# ╰────────╯

# https://github.com/starship/starship
if type starship &> /dev/null 
then
  export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
  eval "$(starship init zsh)"
fi

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
source $XDG_DATA_HOME/zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh
ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BEAM
ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK
ZVM_VI_INSERT_ESCAPE_BINDKEY=jj
ZVM_VI_VISUAL_ESCAPE_BINDKEY=jj

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

function rebuildzcd {
  rm -f $XDG_DATA_HOME/zsh/.zcompdump && compinit
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
