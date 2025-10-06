# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\[\033[01;37m\]\u\[\033[00m\]:\[\033[01;32m\]\W\[\033[00m\]\$\[\033[00m\] '

export LANG=en_US.UTF-8
export EDITOR=vi

# History, ignore duplicates, append
export HISTSIZE="10000"
export HISTFILESIZE="10000"
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
shopt -s histappend

# fzf: Respect .gitignore and don't exclude hidden files
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'

export PATH=$PATH:$PWD/tmux-sessions/

# Kitty
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then
    source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash";
fi

# OS spesific configuration
case "$(uname)" in
  Darwin)
    [ -f "$HOME/.osrc.darwin" ] && . "$HOME/.osrc.darwin"
    ;;
  Linux)
    [ -f "$HOME/.osrc.linux" ] && . "$HOME/.osrc.linux"
    ;;
esac

[ -f $HOME/.alias   ] && . $HOME/.alias
[ -f $HOME/.localrc ] && . $HOME/.localrc

set -o vi

# Machine specific configuration
#
#   Configurations that are specific to a local machine and thus should be
#   checked in should be placed in `.localrc`.
#
#
# Os specific configuration
#
#   Configurations that are specific to an operating system should be placed
#   in `.osrc.darwin` or `.osrc.linux` depending on the OS.
