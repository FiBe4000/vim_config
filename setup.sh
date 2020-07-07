#!/bin/bash

echo "Running FiBe4000 Vim config setup..."

# Date used for backup name
date=$(date +"%d-%m-%Y")

# Path to vim config
vimconfpath=`pwd`

# Find the user running the script
user=`logname`

# Backup current .vimrc if there is one
if [ -e /home/$user/.vimrc ]; then
    sudo -u $user mv /home/$user/.vimrc /home/$user/.vimrc.$date
fi

# Use the new .vimrc
sudo -u $user ln -sfn $vimconfpath/vimrc /home/$user/.vimrc

# Create the directory for persistend undo
sudo -u $user mkdir -p /home/$user/.vim/undodir

# Create the directory for syntax highlighting changes
sudo -u $user mkdir -p /home/$user/.vim/after/syntax

# Install needed packages
pacman -S --noconfirm git python-neovim ctags clang

# Download Vundle for plugin management
sudo -u $user git clone https://github.com/VundleVim/Vundle.vim.git /home/$user/.vim/bundle/Vundle.vim

# Git clone the modified C syntax highlighting and move it to .vim/after/syntax
sudo -u $user git clone https://github.com/agfline/c-syntax.vim.git
sudo -u $user mv c-syntax.vim/c.vim /home/$user/.vim/after/syntax
sudo -u $user rm -rf c-syntax.vim

# Install the plugins specified in .vimrc
sudo -u $user vim +PluginInstall +qall

echo "FiBe4000 Vim config installed."
