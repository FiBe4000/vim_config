#!/bin/bash

DATE=$(date +"%d-%m-%Y")

#Find the user running the script
if [ $SUDO_USER ]; then
    USER=$SUDO_USER
else
    USER=`whoami`
fi

#Backup current .vimrc if there is one
if [ -e ~/.vimrc ]; then
    mv ~/.vimrc ~/.vimrc.$DATE
fi

#Use the new .vimrc
cp .vimrc ~/.vimrc

#Install needed packages
apt-get install -y python2.7-dev
apt-get install -y cmake
apt-get install -y git
apt-get install -y clang

#Download Vundle for plugin management
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#Install the plugins specified in .vimrc
vim +PluginInstall +qall

#Run the setup needed for YouCompleteMe
~/.vim/bundle/YouCompleteMe/install.py --clang-completer

if [ $? -eq 0 ]; then
    chown -R $USER:$USER ~/.vim
    chown -R $USER:$USER ~/.vimrc
    chown -R $USER:$USER ~/.vimrc.$DATE
    echo "Installation done"
else
    echo "Error! See output for more information."
fi

