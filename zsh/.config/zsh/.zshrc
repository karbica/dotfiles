# Dedupe PATH entries automatically
typeset -U path PATH

# OS-specific (Homebrew, ls flavor, colors, WSL helpers; must come before compinit)
case "$OSTYPE" in
  darwin*) _os=darwin ;;
  linux*)  [[ -n $WSL_DISTRO_NAME ]] && _os=wsl ;;
esac
[[ -n $_os && -r $ZDOTDIR/os/$_os.zsh ]] && source "$ZDOTDIR/os/$_os.zsh"
unset _os

# History
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# List shortcuts
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Autocomplete
autoload -Uz compinit && compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# PATH
path=("$HOME/.local/bin" $path)

# pnpm
export PNPM_HOME="$XDG_DATA_HOME/pnpm"
path=("$PNPM_HOME" $path)

# Local overrides
[[ -r ~/.zshrc.local ]] && source ~/.zshrc.local

# Starship (keep last)
command -v starship >/dev/null && eval "$(starship init zsh)"
