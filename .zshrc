#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

source ~/Documents/tab-color.sh
source ~/.ec2

# Customize to your needs...

alias ssh=color-ssh
alias cssh=~/Documents/ssh-host-color.sh

alias ls='ls -hovA --indicator-style=file-type --color=always --group-directories-first --time-style="+%b %_d %Y %H:%M:%S"'

source $HOME/.zprezto/zsh-syntax-highlighting.zsh
source $HOME/.zprezto/zsh-syntax-highlighting-filetypes.zsh
export PATH="$(/usr/local/bin/brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"

eval $(dircolors -b ~/.dircolors)

# Fish-style syntax highlighting for ZSH (by nicoulaj@github):¬
if [[ -f $HOME/.zprezto/zsh-syntax-highlighting.zsh ]]; then

  # override some colors:¬
  ZSH_HIGHLIGHT_STYLES[default]='fg=cyan'
  ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red,bold'
  ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=yellow'
  ZSH_HIGHLIGHT_STYLES[alias]='fg=green'
  ZSH_HIGHLIGHT_STYLES[builtin]='fg=green'
  ZSH_HIGHLIGHT_STYLES[function]='fg=green'
  ZSH_HIGHLIGHT_STYLES[command]='fg=green'
  ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=green'
  ZSH_HIGHLIGHT_STYLES[path]='fg=magenta'
  ZSH_HIGHLIGHT_STYLES[globbing]='fg=blue'
  ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=blue'
  ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=yellow'
  ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=yellow'
  ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=yellow'
  ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=cyan'
  ZSH_HIGHLIGHT_STYLES[assign]='fg=magenta'
  ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=yellow'
  ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=yellow'

  # override colors for matching brackets:
  ZSH_HIGHLIGHT_MATCHING_BRACKETS_STYLES=(
    'fg=blue,bold' # Style for first level of imbrication
    'fg=green,bold' # Style for second level of imbrication
    'fg=magenta,bold' # etc... Put as many styles as you wish, or leave
    'fg=cyan,bold' # empty to disable brackets matching.
    'fg=white,bold'
    'fg=blue'
    'fg=green'
    'fg=magenta'
    'fg=cyan'
    'fg=white'
  )
fi
