Dotfiles
========

- Linux and VIM configuration files

Approach was borrowed from tlee (https://github.com/tlee/vimfiles).

Dot files have been tested with the following versions:
- Red Hat Enterprise Linux 8
- VIM 8.0
- tmux 2.7


## Installation

To install the files and default configuration run the following:

    git clone https://github.com/allaning/dotfiles.git
    cd dotfiles
    bash install.sh

This will install the default configuration files/directories, submodules, and create symbolic links for bundles and snippets. Most of the heavy lifting is done by [install.sh](install.sh).


## Updating

Submodule plug-ins generate `doc/tag` files associated with help documents every time Vim is launched. This creates conflicts associated with pulling, updating or committing changes back to the main repository. It's necessary to clean these out before running any pulls or commits.

There are two shell scripts included to help in this process [clean.sh](clean.sh) and [update.sh](update.sh).


### Updating From The Repository

To update from the latest changes in the repository run the following:

1. Quit out of Vim
- `cd <dotfiles-repo>`
- `bash clean.sh`
- `git stash` or `git add` any updates from your environment spit out by the `clean.sh` call to `git status`
- `git pull --rebase`

Commit your changes back up to the repository.


### Updating Submodules

To pull upstream changes for all of the submodules run the following:

1. Quit out of Vim
- `cd <dotfiles-repo>`
- `bash update.sh`
- `git stash` or `git add` any updates from your environment spit out by the `clean.sh` call to `git status`
- `git pull --rebase`

## Plug-Ins

Plug-ins are managed using [pathogen][pathogen]. All submodule plug-ins are stored in the `bundle_storage` directory and are not available to Vim until they are symlinked to the `bundle` directory. The `bundle` directory is ignored by the repository allowing custom configurations on a per install basis. To activate a plug-in run:

    cd <dotfiles-repo>
    bash add_bundle.sh <bundle-name>

You'll need to restart Vim for the changes to take effect.


### Adding New Plug-Ins As Submodules

New plug-ins need to be added to the `bundle_storage` directory and should be treated as submodules. To add a new one run:

    <Add new submodule to `default_bundles` in `install.sh`>
    cd <dotfiles-repo>
    git submodule add <remote_repository> home/vimfiles/bundle_storage/<bundle-name>
    git submodule init
    git submodule update
    bash add_bundle.sh <bundle-name>

Test it out and if it's a keeper, add it to the repository, add it to the list below with a quick description and tell the world about it's greatness.

[Vim Scripts][vim-scripts] has an enormous amount of repositories for all sorts of plug-ins. However, if the original author has their own github repository, try to clone from there instead.


### Removing Submodules

   1. Delete the relevant line from the `.gitmodules` file
   - Delete the relevant section from `.git/config`
   - Run `git rm --cached path_to_submodule` (**no trailing slash!!**)
   - Note: You may need to `git add .` before executing the above command (else you'll get a warning)
   - Remove the directory from `bundle_storage`
   - Remove the symbolic link from `bundle`
   - Remove module from `install.sh`
   - Remove any descriptions from the `README.md` file


## Auto Generate Ctag and Cscope files

### Linux

Modify GenerateCtagsCscopeFiles.bash to specify which directories to process.

In a terminal, navigate to the top level directory containing
the source code and execute the .bash script.

Example:

    cd /proj/aing
    ~/GenerateCtagsCscopeFiles.bash

### Windows

Modify LaunchGenerateCtagsCscopeFiles.bat to cd to the location of
GenerateCtagsCscopeFiles.

Add LaunchGenerateCtagsCscopeFiles.bat to your startup. In Windows 10,
you can get there by entering shell:startup in File Explorer.

