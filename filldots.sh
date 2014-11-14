#!/bin/sh

dotdir="$HOME/dotfiles"

dotfiles=(
  vimrc
  gvimrc
  agignore
)

for df in ${dotfiles[@]}; do
  ln -s -i -v "$dotdir/$df" "$HOME/.$df"
done
