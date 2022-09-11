# show process id by listening port
function lsport {
  lsof -i:"$1"
}

# get cheat sheet of some command
function tldr {
  curl cheat.sh/"$1"
}

# check the weather through cli
function wttr {
  curl wttr.in/"$1"
}

# search and invoke command from history through fzf
function fh {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}
