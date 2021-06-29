#!/bin/sh

# This script should be run from the dotfiles repo directory

echo "Symlinking bundle..."
full_path=`pwd`
ln -sv $full_path/home/vimfiles/bundle_storage/$1 $full_path/home/vimfiles/bundle/$1

