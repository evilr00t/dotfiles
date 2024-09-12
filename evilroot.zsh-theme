# evilroot.zsh-theme

# kube-ps1 customisation
KUBE_PS1_SYMBOL_ENABLE=false

# display exitcode when >0
# NOTE: Old fscked table
#return_code="%(?..%{$fg[red]%}%?（╯°□°）╯︵ ┻━┻ %{$reset_color%})"
# NOTE: lambda colour
NEWLINE=$'\n'
return_code="%(?.%{$fg[yellow]%}.%{$fg[red]%})λ%{$reset_color%} "
RPROMPT=""

PROMPT='%{$fg[cyan]%}%~$(git_prompt_info)$(git_prompt_short_sha)%{$fg[yellow]%}${NEWLINE}${return_code}'

ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}@%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[red]%}:%{$fg[magenta]%}%{$reset_color%}"

# vi:syntax=sh
