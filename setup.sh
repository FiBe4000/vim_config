#!/bin/bash

DATE=$(date +"%d-%m-%Y")

# Find the user running the script
if [ $SUDO_USER ]; then
    USER=$SUDO_USER
else
    USER=`whoami`
fi

# Backup current .vimrc if there is one
if [ -e ~/.vimrc ]; then
    mv ~/.vimrc ~/.vimrc.$DATE
fi

# Use the new .vimrc
cp .vimrc ~/.vimrc

# Create the directory for persistend undo
mkdir -p ~/.vim/undodir

# Install needed packages
pacman -S --noconfirm git python-neovim ctags clang wget

# Download Vundle for plugin management
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install the plugins specified in .vimrc
vim +PluginInstall +qall

if [ $? -eq 0 ]; then
    chown -R $USER:$USER ~/.vim
    chown -R $USER:$USER ~/.vimrc
    chown -R $USER:$USER ~/.vimrc.$DATE
    echo "Done"
else
    echo "Error! See output for more information."
fi

