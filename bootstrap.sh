#!/usr/bin/env bash

dir=~/.dotfiles
[ ! -d $dir ] && mkdir -pv $dir
for f in .*; do
    [ -d $f ] && continue
    # TODO Handle backup of old dotfiles and symlink of new ones.
    echo $f
done
