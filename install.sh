#!/bin/bash

olddir=${HOME}/dotfiles_old

if [ ! -d "vimconf" ]; then
    git clone https://github.com/timss/vimconf.git
fi

ln -s -f -r vimconf/.vimrc .vimrc

mkdir -p $olddir

files=".bashrc .alias .vimrc.first .vimrc.last .vimrc.plugins .vimrc .tmux.conf .gitconfig .gitignore .config/nvim/init.lua"

if [[ "$OSTYPE" == "darwin"* ]]; then
    files="${files} .bash_profile"
fi

for file in $files; do
    if [ -f ${HOME}/$file ]; then
        echo "Moving existing $file -> $olddir/$file"
        mv ${HOME}/$file $olddir/
    fi

    ln -s  $(pwd)/$file ${HOME}/$file
done

if [[ "$OSTYPE" == "darwin"* ]]; then
    ln -s $(pwd)/clangd/config.yaml ~/Library/Preferences/clangd/config.yaml
else
    ln -s $(pwd)/clangd/config.yaml ~/.config/clangd/config.yaml
fi

source $HOME/.bashrc
