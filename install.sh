#!/bin/sh

# This script should be run from the dotfiles repo directory

default_bundles=(
  ctrlp.vim
  nerdtree
  supertab
  syntastic
  tabular
  taglist
  vim-lua
  vim-surround
)

full_path=`pwd`

echo "Creating directories..."
mkdir -p $full_path/home/vimfiles/bundle
mkdir -p $full_path/home/vimfiles/tmp/swap

echo "Initializing submodules..."
git submodule init
git submodule update
git submodule foreach git checkout master
git submodule foreach git clean -f

echo "Symlinking default bundles..."
for i in "${default_bundles[@]}"; do
  ln -sv $full_path/home/vimfiles/bundle_storage/$i $full_path/home/vimfiles/bundle/$i
done

echo "Symlinking dot files to home directory"
for f in `ls -A $full_path/home/ | grep "^\."`; do
  ln -sv $full_path/home/$f $HOME/$f
done

echo "Symlinking vimfiles to home directory"
for f in `ls -A $full_path/home/vimfiles/`; do
  ln -sv $full_path/home/vimfiles/$f $HOME/.vim/$f
done

