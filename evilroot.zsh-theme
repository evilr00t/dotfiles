#!/usr/bin/env sh
# evilroot.zsh-theme

function get_short_sha() {
  echo -n "$(git_prompt_short_sha)%{$reset_color%}"
}

# kube-ps1 customisation
KUBE_PS1_SYMBOL_ENABLE=false

# display exitcode when >0
return_code="%(?..%{$fg[red]%}%?（╯°□°）╯︵ ┻━┻ %{$reset_color%})"
RPROMPT=""

PROMPT='${return_code}%{$fg[magenta]%}%~$(git_prompt_info)$(get_short_sha)$(git_prompt_status)%{$fg[yellow]%} λ%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%}@%{$fg[yellow]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="%{$fg[red]%}sha:%{$fg[blue]%}"

# vi:syntax=sh
