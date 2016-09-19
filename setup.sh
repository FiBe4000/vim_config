#!/bin/bash

DATE=$(date +"%m-%d-%Y")

#Backup current .vimrc if there is one
if [ -e ~/.vimrc ]; then
    mv ~/.vimrc ~/.vimrc.$DATE
fi

#Use the new .vimrc
cp .vimrc ~/.vimrc

#Install needed packages (including Vim)
apt-get install -y vim
apt-get install -y git
apt-get install -y clang

#Download Vundle for plugin management
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#Install the plugins specified in .vimrc
vim +PluginInstall +qall

#Run the setup needed for YouCompleteMe
~/.vim/bundle/YouCompleteMe/install.py --clang-completer

echo "Installation done"

