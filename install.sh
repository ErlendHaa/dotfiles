#!/bin/bash
set -e

olddir=${HOME}/dotfiles_old

echo -e "Creating '$olddir' for existing files\n"
mkdir -p $olddir

files=".bashrc .alias .vimrc.first .vimrc.last .vimrc.plugins .tmux.conf .gitconfig .gitignore"

if [[ "$OSTYPE" == "darwin"* ]]; then
    files="${files} .bash_profile"
fi

for file in $files; do
    if [ -f ${HOME}/$file ]; then
        echo "Moving existing $file -> $olddir/$file"
        mv ${HOME}/$file $oldir/
    fi

    echo -e "Creating symlink to $(pwd)/$file in home directory\n"
    ln -s  $(pwd)/$file ${HOME}/$file
done


if [[ "$OSTYPE" == "darwin"* ]]; then
    ln -s ${pwd}/clangd/config.yaml ~/Library/Preferences/clangd/config.yaml
else
    ln -s ${pwd}/clangd/config.yaml ~/.config/clangd/config.yaml
fi

if [ -f ${HOME}/.vimrc ]; then
    echo "Moving existing .vimrc -> $olddir/"
    mv ${HOME}/.vimrc $oldir/
fi
echo "Fetching vimconfig: https://github.com/timss/vimconf.git"
git clone https://github.com/timss/vimconf.git ~/vimconf

echo "Creating symlink to ~/vimconf/.vimrc in home directory."
ln -s ${HOME}/vimconf/.vimrc ${HOME}/.vimrc

source $HOME/.bashrc
