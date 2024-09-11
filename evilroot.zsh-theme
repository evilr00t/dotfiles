# evilroot.zsh-theme

# kube-ps1 customisation
KUBE_PS1_SYMBOL_ENABLE=false

# display exitcode when >0
return_code="%(?..%{$fg[red]%}%?（╯°□°）╯︵ ┻━┻ %{$reset_color%})"
RPROMPT=""

PROMPT='${return_code}%{$fg[cyan]%}%~$(git_prompt_info)%{$fg[yellow]%} λ%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}@%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[red]%}:%{$fg[magenta]%}$(git_prompt_short_sha)%{$reset_color%}"

# vi:syntax=sh
