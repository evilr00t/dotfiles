# evilroot.zsh-theme
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}@%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[red]%}:%{$fg[magenta]%}%{$reset_color%}"
RPROMPT=""
NEWLINE=$'\n'
return_code="%(?.%{$fg[yellow]%}.%{$bg[red]%})λ%{$reset_color%} "
PROMPT='%{$fg[cyan]%}%~$(git_prompt_info)$(git_prompt_short_sha)%{$fg[yellow]%}${NEWLINE}${return_code}'

# NOTE: Old fscked table
#return_code="%(?..%{$fg[red]%}%?（╯°□°）╯︵ ┻━┻ %{$reset_color%})"

# vi:syntax=sh
