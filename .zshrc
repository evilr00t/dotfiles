# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
# Disable all the magic plugins - I really don't like them
# https://github.com/ohmyzsh/ohmyzsh/issues/6338
DISABLE_MAGIC_FUNCTIONS=true

ZSH_THEME="evilroot"

CASE_SENSITIVE="false"

HYPHEN_INSENSITIVE="false"

DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="dd.mm.yyyy"
HIST_IGNORE_SPACE="true"
plugins=(osx history history-substring-search git-prompt git z kube-ps1 colored-man-pages vi-mode extract fast-syntax-highlighting)
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh


eval $( dircolors -b $HOME/.dircolors )
export LC_CTYPE=en_GB.UTF-8
export LANG=en_GB.UTF-8
set umask 022
unsetopt nomatch

# ignore duplicate entries
setopt hist_ignore_all_dups

# fzf via Homebrew
if [ -e /usr/local/opt/fzf/shell/completion.zsh ]; then
  source /usr/local/opt/fzf/shell/key-bindings.zsh
  source /usr/local/opt/fzf/shell/completion.zsh
fi

# fzf + ag configuration
export FZF_DEFAULT_COMMAND='ag -u --nocolor -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--height 80% --layout=reverse'
source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Custom things
. ~/.zshenv
