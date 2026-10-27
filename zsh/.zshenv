# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# XDG Extended
# The following tools don't support XDG by default.
export LESSHISTFILE="$XDG_STATE_HOME/less/history"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/.npmrc"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/config"
export PNPM_HOME="$XDG_DATA_HOME/pnpm"

# Local
[[ -r ~/.zshenv.local ]] && source ~/.zshenv.local
