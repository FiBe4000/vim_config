#!/bin/sh

date=$(date +"%d-%m-%Y")

# Find the user running the script
if [ $SUDO_USER ]; then
    user=$SUDO_USER
else
    user=`whoami`
fi

# Backup current .vimrc if there is one
if [ -e /home/$user/.vimrc ]; then
    sudo -u mv /home/$user/.vimrc /home/$user/.vimrc.$date
fi

# Use the new .vimrc
sudo -u $user cp .vimrc /home/$user/.vimrc

# Create the directory for persistend undo
sudo -u $user mkdir -p /home/$user/.vim/undodir

# Install needed packages
pacman -S --noconfirm git python-neovim ctags clang wget

# Download Vundle for plugin management
sudo -u $user git clone https://github.com/VundleVim/Vundle.vim.git /home/$user/.vim/bundle/Vundle.vim

# Install the plugins specified in .vimrc
sudo -u $user vim +PluginInstall +qall

if [ $? -eq 0 ]; then
    sudo -u $user chown -R $user:$user home/$user/.vim
    sudo -u $user chown -R $user:$user home/$user/.vimrc
    sudo -u $user chown -R $user:$user home/$user/.vimrc.$date
    echo "Done"
else
    echo "Error! See output for more information."
fi

