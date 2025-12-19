# If not running interactively, don't do anything
[[ -o interactive ]] || return

# Prompt
PROMPT='%F{white}%n%f:%F{green}%1~%f$ '

export LANG=en_US.UTF-8
export EDITOR=vi

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS

# fzf: Respect .gitignore and don't exclude hidden files
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'

# PATH
export PATH="$PATH:$PWD/tmux-sessions/"

# Kitty
if [[ -n "$KITTY_INSTALLATION_DIR" && -e "$KITTY_INSTALLATION_DIR/shell-integration/zsh/kitty.zsh" ]]; then
  source "$KITTY_INSTALLATION_DIR/shell-integration/zsh/kitty.zsh"
fi

# Os specific configuration
#
#   Configurations that are specific to an operating system should be placed
#   in `.osrc.darwin` or `.osrc.linux` depending on the OS.
case "$(uname)" in
  Darwin)
    [[ -f "$HOME/.osrc.darwin" ]] && source "$HOME/.osrc.darwin"
    ;;
  Linux)
    [[ -f "$HOME/.osrc.linux" ]] && source "$HOME/.osrc.linux"
    ;;
esac

# Aliases
[[ -f "$HOME/.alias" ]] && source "$HOME/.alias"

# Machine specific configuration
#
#   Configurations that are specific to a local machine and thus should be
#   checked in should be placed in `.localrc`.
[[ -f "$HOME/.localrc" ]] && source "$HOME/.localrc"

# Vi keybindings
bindkey -v
