#!/usr/bin/env bash

# to bootstrap vim really quickly...
# by evilroot

# check if curl or wget is available
if which wget >/dev/null 2>&1;
then
    COMMAND=wget
elif which curl >/dev/null 2>&1;
then
    COMMAND=curl
else
 echo 'No wget or curl installed - exiting...'
 exit 1
fi

# check if we have git
if ! which git >/dev/null 2>&1;
then
echo 'git is not installed - exiting...'
exit 1
fi

# check if we have git
if ! which vim >/dev/null 2>&1;
then
echo 'vim is not installed - exiting...'
exit 1
fi

# backup old vim
if [ -e ~/.vimrc ]; then
mv ~/.vimrc ~/.vimrc-old
fi

if [ -e ~/.vim ]; then
mv ~/.vim ~/.vim-old
fi

$COMMAND https://raw.githubusercontent.com/evilr00t/dotfiles/master/.vimrc -O ~/.vimrc
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s ~/.vim $XDG_CONFIG_HOME/nvim
ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
nvim +PluginInstall +qall
