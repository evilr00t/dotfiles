# evilroot.zsh-theme

function get_short_sha() {
  echo -n "$(git_prompt_short_sha)%{$reset_color%}"
}

# kube-ps1 customisation
KUBE_PS1_SYMBOL_ENABLE=false

PROMPT='${return_code}%{$fg[green]%}%d$(git_prompt_info)$(get_short_sha)$(git_prompt_status) $(kube_ps1)
%{$fg[magenta]%}❯%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%} at %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
#ZSH_THEME_GIT_PROMPT_DIRTY=""
#ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%} ✔"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=":%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER=""

# display exitcode on the right when >0
return_code="%(?..%{$fg[red]%}%?（╯°□°）╯︵ ┻━┻ %{$reset_color%})"

RPROMPT=''

ZSH_THEME_GIT_PROMPT_ADDED=""
ZSH_THEME_GIT_PROMPT_MODIFIED=""
ZSH_THEME_GIT_PROMPT_DELETED=""
ZSH_THEME_GIT_PROMPT_RENAMED=""
ZSH_THEME_GIT_PROMPT_UNMERGED=""
ZSH_THEME_GIT_PROMPT_UNTRACKED=""

# vi:syntax=sh
