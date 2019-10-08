# evilroot.zsh-theme

function get_short_sha() {
  echo -n "$(git_prompt_short_sha)%{$reset_color%}"
}

PROMPT='${return_code}%{$fg_bold[green]%}[%{$fg_bold[red]%}%~%{$fg[green]%}]$(git_prompt_info)$(get_short_sha)$(git_prompt_status) $(kube_ps1)
%{$fg_bold[magenta]%}❯%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[yellow]%} @ %{$fg_bold[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ✘"
ZSH_THEME_GIT_PROMPT_DIRTY=""
#ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%} ✔"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" %{$fg_bold[red]%}[%{$fg_bold[blue]%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$fg_bold[red]%}]"

# display exitcode on the right when >0
return_code="%(?..%{$fg[red]%}%?（╯°□°）╯︵ ┻━┻ %{$reset_color%})"

RPROMPT=''

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%}!"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}-"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%}>"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%}#"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%}?"

# vi:syntax=sh
