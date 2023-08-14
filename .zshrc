# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
# Disable all the magic plugins - I really don't like them
# https://github.com/ohmyzsh/ohmyzsh/issues/6338
DISABLE_MAGIC_FUNCTIONS=true

HISTSIZE=999999999
SAVEHIST=999999999

ZSH_THEME="evilroot"

CASE_SENSITIVE="false"

HYPHEN_INSENSITIVE="false"

DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="dd.mm.yyyy"
HIST_IGNORE_SPACE="true"
plugins=(history history-substring-search git-prompt colored-man-pages extract fast-syntax-highlighting ssh-agent gpg-agent fzf-tab)
autoload -Uz compinit

for dump in ~/.zcompdump(N.mh+24); do
  compinit
done

#compinit -C
source $ZSH/oh-my-zsh.sh

# from: https://gist.github.com/15cm/88e320d71fe7fe5a4bb24b99da6b93f0

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

# fzf + ripgrep configuration
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--height 80% --layout=reverse'
export MCFLY_KEY_SCHEME=vim
export MCFLY_RESULTS=50
export MCFLY_FUZZY=2
export MCFLY_INTERFACE_VIEW=BOTTOM
export MCFLY_DISABLE_MENU=TRUE
export MCFLY_RESULTS_SORT=LAST_RUN

source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Custom things
. ~/.zshenv
eval "$(zoxide init zsh)"
eval "$(mcfly init zsh)"
