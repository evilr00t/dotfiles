# evilroot.zsh-theme

#function get_right_prompt() {
#    if git rev-parse --git-dir > /dev/null 2>&1; then
#        echo -n "$(git_prompt_short_sha)%{$reset_color%}"
#    else
#        echo -n "%{$reset_color%}"
#    fi
#}

if [[ "$TERM" != "dumb" ]] && [[ "$DISABLE_LS_COLORS" != "true" ]]; then
    #PROMPT='%{$fg[cyan]%}%n%{$reset_color%}%{$fg[green]%}[%{$fg[red]%}%~%{$fg[green]%}]$(git_prompt_info)$(git_prompt_status)
#${return_code}%{$fg[yellow]%}λ%{$reset_color%}: '
    PROMPT='%{$fg[cyan]%}%{$reset_color%}%{$fg[green]%}[%{$fg[red]%}%~%{$fg[green]%}]$(git_prompt_info)$(git_prompt_status)
${return_code}%{$fg[yellow]%}λ%{$reset_color%}: '

    ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%} @ %{$fg[blue]%}"
    ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
    ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ✘"
    ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%} ✔"
    ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" %{$fg_bold[white]%}[%{$fg_bold[blue]%}"
    ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$fg_bold[white]%}]"

    # display exitcode on the right when >0
    return_code="%(?..%{$fg[red]%}%?（╯°□°）╯︵ ┻━┻ %{$reset_color%})"

    #RPROMPT='${return_code}  $(git_prompt_status)%{$reset_color%}'
    #RPROMPT='$(get_right_prompt)'
    RPROMPT=''

    ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}+"
    ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%}!"
    ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}-"
    ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%}>"
    #ZSH_THEME_GIT_PROMPT_RENAMED=""
    ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%}#"
    #ZSH_THEME_GIT_PROMPT_UNMERGED=""
    ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%}?"
    #ZSH_THEME_GIT_PROMPT_UNTRACKED=""
    ZSH_THEME_GIT_PROMPT_AHEAD=" %{$fg_bold[white]%}^"
else
    PROMPT='[%n@%m:%~$(git_prompt_info)]
%# '

    ZSH_THEME_GIT_PROMPT_PREFIX=" on"
    ZSH_THEME_GIT_PROMPT_SUFFIX=""
    ZSH_THEME_GIT_PROMPT_DIRTY=""
    ZSH_THEME_GIT_PROMPT_CLEAN=""

    # display exitcode on the right when >0
    return_code="%(?..%? （╯°□°）╯︵ ┻━┻)"

    #RPROMPT='${return_code}  $(git_prompt_status)'

    ZSH_THEME_GIT_PROMPT_ADDED=" ✚"
    ZSH_THEME_GIT_PROMPT_MODIFIED=" ✹"
    ZSH_THEME_GIT_PROMPT_DELETED=" ✖"
    ZSH_THEME_GIT_PROMPT_RENAMED=" ➜"
    ZSH_THEME_GIT_PROMPT_UNMERGED=" ═"
    ZSH_THEME_GIT_PROMPT_UNTRACKED=" ✭"
fi
