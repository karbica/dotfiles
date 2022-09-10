#!/usr/bin/env bash

#dir=~/.dotfiles
#[ ! -d $dir ] && mkdir -pv $dir
#for f in .*; do
#    [ -d $f ] && continue
#    # TODO Handle backup of old dotfiles and symlink of new ones.
#    echo $f
#done

os=$(uname)
programs="htop bat rg fzf jq nvim volta deno go kitty"

function check() {
  for p in $programs
    do
      which $p > /dev/null
      if [ $? -eq 0 ]
      then
        echo has $p
      else
        echo has not $p
      fi
  done
}

function usage() {
    echo "A thing to make the machine good."
    echo ""
    echo "USAGE:"
    echo "\t ./bootstrap [COMMAND]"
    echo ""
    echo "COMMANDS:"
    echo "\t check Checks to see if the extra programs are installed"
    echo "\t install Installs the extra programs and performs symlinking"
    echo "\t help Prints help text"
}

case $1 in
    check) check ;;
    help) usage ;;
    *) usage ;;
esac
