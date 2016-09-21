# vim_config
This is my preferred Vim configuration. It includes:
* Easy plugin management
* Auto indentation using spaces instead of tabs
* Syntax highlighting
* Code folding
* Code completion
* Improved searching
* And an additional number of small improvements, see the .vimrc!

## Installation
The installation instructions and the setup.sh script is made for Ubuntu, but may work on other distros with the APT package manager installed.
First of all you need to install Vim. You install the latest version of Vim by running the follwing commands:
```
sudo add-apt-repository ppa:pkg-vim/vim-daily
sudo apt-get update
sudo apt-get install vim
```
To install the configuration and plugins, simply run setup.sh
The setup may install some needed packages if they are not already installed.
This Vim configuration uses Vundle to manage plugins. The plugin installation will be done through Vim and may take some minutes to complete.

## Plugins
This configuration uses the following plugins:

* [Vundle](https://github.com/VundleVim/Vundle.vim)
* [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
* [YCM-Generator](https://github.com/rdnetto/YCM-Generator)

## Usage
This configuration uses the standard Vim key mapping, except:

* Press Enter after you are done with a search to turn of the search highlighting.

See the github pages for usage of the different plugins. This is recommended in order to use the code completion mechanism in an efficient way.
You can update the plugins by starting Vim and run:
```
:PluginUpdate
```

If you don't want to remove a plugin comment/delete it from the .vimrc and and run:
```
:PluginClean
```
in Vim.

## Future features
* I'm currently looking into more plugins to use for more IDE-like functionality in Vim.
* Maybe some more convenient key mappings?
* I will probably update the .vimrc with more tweaks and improvements.
* I will update the setup.sh script to a more sophisticated version later on as the configuration expands.
