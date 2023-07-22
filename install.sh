#!/bin/bash

olddir=${HOME}/dotfiles_old

if [ ! -d "vimconf" ]; then
    git clone https://github.com/timss/vimconf.git
fi

ln -sf vimconf/.vimrc .vimrc

mkdir -p $olddir

files=".bashrc .alias .vimrc.first .vimrc.last .vimrc.plugins .vimrc .tmux.conf .gitconfig .gitignore .config/nvim/init.lua .ssh/config"

mkdir -p ${HOME}/.config/nvim

if [[ "$OSTYPE" == "darwin"* ]]; then
    files="${files} .bash_profile"
fi

for file in $files; do
    if [ -f ${HOME}/$file ]; then
        echo "Moving existing $file -> $olddir/$file"
        mv ${HOME}/$file $olddir/
    fi

    ln -sf  $(pwd)/$file ${HOME}/$file
done

if [[ "$OSTYPE" == "darwin"* ]]; then
    mkdir -p ~/Library/Preferences/clangd
    ln -s $(pwd)/clangd/config.yaml ~/Library/Preferences/clangd/config.yaml
else
    mkdir -p ${HOME}/.config/clangd
    ln -s $(pwd)/clangd/config.yaml ~/.config/clangd/config.yaml
fi

source $HOME/.bashrc
