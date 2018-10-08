# vim_config
This is my preferred Vim configuration. It includes:
* Easy plugin management
* Auto indentation using spaces instead of tabs
* Syntax highlighting
* Code folding
* Code completion
* Improved searching
* Indent guides
* Automatic closing of brackets and parentheses
* Nerdtree for browsing files
* Tagbar for browsing in the current file
* Ctags for jumping to definitions etc
* A Solarized Dark theme with an Airline bar and Devicons
* Git plugins for Nerdree and Airline
* Better syntax highlighting for C-languages
* And an additional number of small improvements, see the .vimrc!

## Installation
The installation instructions and the setup.sh script is made for Arch Linux, but may work on other Arch-based distros with the Pacman package manager installed. This configuration requires Vim8.

To install the configuration and plugins, simply run setup.sh
The setup may install some needed packages if they are not already installed.
This Vim configuration uses Vundle to manage plugins. The plugin installation will be done through Vim and may take some minutes to complete.

## Plugins
This configuration uses the following plugins:

* [Vundle](https://github.com/VundleVim/Vundle.vim)
* [vim-colors-solarized] (https://github.com/altercation/vim-colors-solarized)
* [nerdtree] (https://github.com/scrooloose/nerdtree)
* [nerdcommenter] (https://github.com/scrooloose/nerdcommenter)
* [vim-fugitive] (https://github.com/tpope/vim-fugitive)
* [vim-airline] (https://github.com/vim-airline/vim-airline)
* [vim-airline-themes] (https://github.com/vim-airline/vim-airline-themes)
* [delimitmate] (https://github.com/Raimondi/delimitMate)
* [nerdtree-git-plugin] (https://github.com/Xuyuanp/nerdtree-git-plugin)
* [vim-indentguides] (https://github.com/thaerkh/vim-indentguides)
* [tagbar] (https://github.com/majutsushi/tagbar)
* [nvim-yarp] (https://github.com/roxma/nvim-yarp)
* [vim-hug-neovim] (https://github.com/roxma/vim-hug-neovim-rpc)
* [deoplete] (https://github.com/Shougo/deoplete.nvim)
* [neoinclude] (https://github.com/Shougo/neoinclude.vim)
* [deoplete-clang] (https://github.com/zchee/deoplete-clang)
* [vim-syntax-extra] (https://github.com/justinmk/vim-syntax-extra)
* [vim-devicons] (https://github.com/ryanoasis/vim-devicons)

## Usage
This configuration uses the standard Vim key mapping, except:

* <kbd>Enter</kbd> after you are done with a search to turn off the search highlighting
* <kbd>F2</kbd> toggle Nerdtree
* <kbd>F3</kbd> to toggle Tagbar
* <kbd>,</kbd>+<kbd>i</kbd> to toggle indent guides
* <kbd>,</kbd>+<kbd>f</kbd> as an alternative way to toggle Nerdtree
* <kbd>Tab</kbd> and <kbd>Shift</kbd>+<kbd>Tab</kbd> to navigate Deoplete suggestions

See the github pages for usage of the different plugins. This is recommended in order to use the code completion mechanism in an efficient way.
You can update the plugins by starting Vim and run:
```
:PluginUpdate
```

If you want to remove a plugin comment/delete it from the .vimrc and and run:
```
:PluginClean
```
in Vim.

