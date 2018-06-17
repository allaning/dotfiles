Dotfiles
========

- VIM configuration file(s)

Create a symbolic link to the cloned git repo.  Example:
```
ln -s /home/allan/git/allaning/dotfiles/.vimrc ~/.vimrc
```


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

