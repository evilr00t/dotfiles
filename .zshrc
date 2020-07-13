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

export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
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
export FZF_DEFAULT_OPTS='--height 50% --layout=reverse --min-height=15'

source $HOME/repos/dotfiles/zsh-autosuggestions/zsh-autosuggestions.zsh

#source $HOME/repos/dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#ZSH_HIGHLIGHT_MAXLENGTH=512

#ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor regexp line)
## brackets
#ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=blue,bold'
#ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=red,bold'
#ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=yellow,bold'
#ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=magenta,bold'
## cursor
#ZSH_HIGHLIGHT_STYLES[cursor]='bg=blue'
## main
## default
#ZSH_HIGHLIGHT_STYLES[default]='none'
## unknown
#ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
## command
#ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=magenta,bold'
#ZSH_HIGHLIGHT_STYLES[alias]='fg=yellow,bold'
#ZSH_HIGHLIGHT_STYLES[builtin]='fg=green,bold'
#ZSH_HIGHLIGHT_STYLES[function]='fg=green,bold'
#ZSH_HIGHLIGHT_STYLES[command]='fg=green'
#ZSH_HIGHLIGHT_STYLES[precommand]='fg=blue,bold'
#ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=yellow'
#ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=green'
#ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=blue,bold'
#ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=blue,bold'
## path
#ZSH_HIGHLIGHT_STYLES[path]='fg=cyan,bold'
#ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=cyan'
#ZSH_HIGHLIGHT_STYLES[path_approx]='fg=cyan'
## shell
#ZSH_HIGHLIGHT_STYLES[globbing]='fg=cyan'
#ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=blue'
#ZSH_HIGHLIGHT_STYLES[assign]='fg=magenta'
#ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=cyan'
#ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=cyan'
#ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=blue'
## quotes
#ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=yellow,underline'
#ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=yellow'

# Custom things
. ~/.zshenv
