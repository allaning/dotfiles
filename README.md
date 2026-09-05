Dotfiles
========

- Linux and utilities configuration files

Dot files have been tested with the following versions:
- Linux Mint 22.3 Cinnamon
- VIM 9.1
- tmux 3.4


## Installation

To install the files and default configuration run the following:

    cd ~
    git clone https://github.com/allaning/dotfiles.git
    cd dotfiles/
    ./install.sh

This will install the default configuration files/directories and create symbolic links. Most of the heavy lifting is done by [install.sh](install.sh).


## VIM Plug-Ins

Vim plug-ins are managed using vim-plug (https://github.com/junegunn/vim-plug). Edit the .vimrc file to add and remove plugins.

vim-plug plugin manager usage:
   Update the plugin list ("Plug 'somebody/plugin-name')
   Reload the file or restart Vim, then you can:
     :PlugInstall to install the plugins.
     :PlugUpdate to update the plugins. After the update is finished, you can review the changes by pressing D in the window. Or you can do it later by running :PlugDiff.
     Delete or comment out Plug commands for the plugins you want to remove.
     :PlugClean. It will detect and remove undeclared plugins.


## Generate Ctag and Cscope files

### Linux

Modify GenerateCtagsCscopeFiles.bash to specify which directories to process.

In a terminal, navigate to the top level directory containing
the source code and execute the .bash script.

Example:

    cd /proj/aing/
    ~/GenerateCtagsCscopeFiles.bash

### Windows

Modify LaunchGenerateCtagsCscopeFiles.bat to cd to the location of
GenerateCtagsCscopeFiles.

Add LaunchGenerateCtagsCscopeFiles.bat to your startup. In Windows 10,
you can get there by entering shell:startup in File Explorer.

