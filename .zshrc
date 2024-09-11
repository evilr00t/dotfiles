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
export LC_CTYPE=en_GB.UTF-8
export LANG=en_GB.UTF-8
plugins=(history history-substring-search git-prompt colored-man-pages extract ssh-agent gpg-agent fzf-tab F-Sy-H zsh-fzf-history-search)

source $ZSH/oh-my-zsh.sh

autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
# from: https://gist.github.com/15cm/88e320d71fe7fe5a4bb24b99da6b93f0

eval $( gdircolors -b $HOME/.dircolors )

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
export FZF_DEFAULT_OPTS='--height 60% --layout=reverse --color=bg+:#293739,bg:#1B1D1E,border:#808080,spinner:#E6DB74,hl:#7E8E91,fg:#F8F8F2,header:#7E8E91,info:#A6E22E,pointer:#A6E22E,marker:#F92672,fg+:#F8F8F2,prompt:#F92672,hl+:#F92672 --prompt "$ " --pointer ">" --marker "->"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"


source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Custom things
. ~/.zshenv
eval "$(zoxide init zsh)"
