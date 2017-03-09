# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
. ~/repos/z/z.sh
. ~/.zshenv
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="honukai"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autopep8 brew brew-cask bundler coffee github gitignore history history-substring-search mosh osx pep8 postgres rsync python zsh-syntax-highlighting)

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source ~/Documents/tab-color.sh
source $HOME/.zprezto/zsh-syntax-highlighting.zsh
source $HOME/.zprezto/zsh-syntax-highlighting-filetypes.zsh

alias ssh=color-ssh
alias mosh=color-mosh

export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"
eval $( dircolors -b $HOME/.dircolors )
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8
set umask 022


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

# ignore duplicate entries
setopt hist_ignore_all_dups
setopt hist_ignore_space

#Auto Escape URLS
autoload -U url-quote-magic
zle -N self-insert url-quote-magic
