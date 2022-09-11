# base directory specification
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
# https://wiki.archlinux.org/title/XDG_Base_Directory
: ${XDG_CONFIG_HOME:=$HOME/.config}
: ${XDG_STATE_HOME:=~/.local/state}

# zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
 