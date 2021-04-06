local NEWLINE=$'\n'
local CUR_DIR_END="%{$fg_bold[yellow]%}"$""
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
local directory_route="%{$fg_bold[cyan]%}%~${CUR_DIR_END}${NEWLINE}"
local user_name="%{$fg_bold[blue]%}%n"
local host_name="%{$fg_bold[yellow]%}"@"%M"
local USER_INFO="${user_name}${host_name}"
local JOBS_INFO="%{$fg_bold[red]%}[%j]%{$reset_color%}"
PROMPT='${directory_route}${USER_INFO} ${JOBS_INFO} ${ret_status}\
%{$reset_color%}$(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
