# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
. ~/repos/z/z.sh
. ~/.zshenv

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="kphoen"
ZSH_THEME="evilroot"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="false"

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
HIST_STAMPS="dd.mm.yyyy"
HIST_IGNORE_SPACE="true"
# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(osx django httpie history mvn python)

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
alias ssh=color-ssh
alias mosh=color-mosh

export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
eval $( dircolors -b $HOME/.dircolors )
export LC_CTYPE=en_GB.UTF-8
export LANG=en_GB.UTF-8
set umask 022

# ignore duplicate entries
setopt hist_ignore_all_dups
setopt hist_ignore_space

#Auto Escape URLS
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
#export PATH="$PATH:$HOME/.rvm/bin"
#
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor line regexp root)

# fzf via Homebrew
if [ -e /usr/local/opt/fzf/shell/completion.zsh ]; then
  source /usr/local/opt/fzf/shell/key-bindings.zsh
  source /usr/local/opt/fzf/shell/completion.zsh
fi

# fzf + ag configuration
export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='
--color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
--color info:108,prompt:109,spinner:108,pointer:168,marker:168
'

source $HOME/repos/dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# brackets
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=magenta,bold'
# cursor
#ZSH_HIGHLIGHT_STYLES[cursor]='bg=blue'
# main
# default
ZSH_HIGHLIGHT_STYLES[default]='none'                                 # стандартный цвет
# unknown
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'                         # неизвестная команда
# command
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=magenta,bold'                # зарезервированное слово
ZSH_HIGHLIGHT_STYLES[alias]='fg=yellow,bold'                         # алиас
ZSH_HIGHLIGHT_STYLES[builtin]='fg=green,bold'                        # built-in функция (например, echo)
ZSH_HIGHLIGHT_STYLES[function]='fg=green,bold'                       # функция, определенная в шелле
ZSH_HIGHLIGHT_STYLES[command]='fg=green'                             # обычная команда
ZSH_HIGHLIGHT_STYLES[precommand]='fg=blue,bold'                      # пре-команда (например, sudo в sudo cp ...)
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=yellow'                   # разделитель команд, && || ;
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=green'                      # команда, найденная в путях (hashed)
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=blue,bold'            # флаги типа -*
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=blue,bold'            # флаги типа --*
# path
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan,bold'                            # станлартный путь
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=cyan'                          # префикс пути
ZSH_HIGHLIGHT_STYLES[path_approx]='fg=cyan'                          # примерный путь
# shell
ZSH_HIGHLIGHT_STYLES[globbing]='fg=cyan'                             # шаблон (например, /dev/sda*)
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=blue'                    # подстановка из истории (команда, начинающаяся с !)
ZSH_HIGHLIGHT_STYLES[assign]='fg=magenta'                            # присвоение
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=cyan'        # конструкции типа "$VARIABLE"
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=cyan'          # конструкции типа \"
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=blue'                 # конструкции типа `command`
# quotes
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=yellow,underline'   # конструкции типа 'text'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=yellow'             # конструкции типа "text"
