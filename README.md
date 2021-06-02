Dotfiles
========

- VIM configuration file(s)

## Installation

To install the files and default configuration run the following:

    git clone https://github.com/allaning/dotfiles.git
    cd dotfiles
    bash install.sh

This will install the default configuration files/directories, submodules, and create symbolic links for bundles and snippets. Most of the heavy lifting is done by the [install script][install.sh].


- Auto Generate Ctag and Cscope files

Place the GenerateCtagsCscopeFiles.bat|bash files at the top level of
the source code. For Synergy, this can be your work area location; For
ClearCase, it could be where your VOBs are located.

Modify GenerateCtagsCscopeFiles.bash PATH_TO_SOURCE to point to the top
level from which to start ctags and cscope.

Modify LaunchGenerateCtagsCscopeFiles.bat to cd to the location of the
GenerateCtagsCscopeFiles.

Add LaunchGenerateCtagsCscopeFiles.bat to your startup. In Windows 10,
you can get there by entering shell:startup in File Explorer.

