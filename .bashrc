# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Bash prompt
PS1='\[\033[01;37m\]\u\[\033[00m\]:\[\033[01;32m\]\W\[\033[00m\]\$\[\033[00m\] '

# Setting PATH for Python 3.8
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.8/:$PATH"
PATH="/Users/ERHA/Library/Python/3.8/bin:$PATH"
PATH="~/dotfiles/tmux-sessions:$PATH"
export PATH

# Always use UTF8
export LANG=en_US.UTF-8

# History, ignore duplicates, append
export HISTSIZE="10000"
export HISTFILESIZE="10000"
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
shopt -s histappend

# Source additional files; alias
if [ -f $HOME/.alias ]; then source $HOME/.alias; fi

# Enable git completion on macos/bash
if [[ "$OSTYPE" == "darwin"* && "$SHELL" == "/bin/bash" ]]; then
    . ~/.git-completion.bash
fi
