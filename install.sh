#!/bin/sh

# This script should be run from the ~/dotfiles/ repo directory

full_path=`pwd`
mkdir -p ~/.vim/tmp/swap


echo "Creating directories..."
mkdir -p $full_path/home/vimfiles/tmp/swap

echo "Symlinking dot files to home directory"
for f in `ls -A $full_path/home/ | grep "^\."`; do
  ln -sv $full_path/home/$f $HOME/$f
done

echo "Symlinking vimfiles to home directory"
for f in `ls -A $full_path/home/vimfiles/`; do
  ln -sv $full_path/home/vimfiles/$f $HOME/.vim/$f
done

echo "Symlinking vifmrc file"
ln -sv $full_path/home/config/vifm/vifmrc $HOME/.config/vifm/vifmrc

echo "Symlinking kitty.conf file"
ln -sv $full_path/home/config/kitty/kitty.conf $HOME/.config/kitty/kitty.conf

echo "Symlinking genmon files"
for f in `ls -A $full_path/home/config/genmon-scripts/`; do
  ln -sv $full_path/home/config/genmon-scripts/$f $HOME/.config/genmon-scripts/$f
done

