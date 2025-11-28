local NEWLINE=$'\n'
local CURSOR="$"
local SUBCURSOR=">"

local lines_color="%F{#e5e5e5}"

draw() {
	echo "%b${lines_color}$1%f"
}

prompt_group() {
	echo "$(draw "[")%B$1%b$(draw "]")"
}

prompt_cwd() {
	prompt_group "%F{#00e5e5}%~"
}

prompt_user_info() {
	prompt_group "$(prompt_user)%F{#9696ff}@$(prompt_host)"
}

prompt_user() {
	echo "%F{#6767ff}%n"
}

prompt_host() {
	echo "%F{#67ff67}%M"
}

prompt_jobs() {
	prompt_group "%F{#e59400}Jobs: %j"
}

prompt_ret_status() {
	echo "%(?:%F{#67ff67}:%F{#ef0000})%B${CURSOR}%b%f"
}

PROMPT='\
$(draw "┌─$(prompt_cwd)")${NEWLINE}\
$(draw "└─$(prompt_user_info)$(prompt_jobs)$(prompt_ret_status)") $(git_prompt_info)'
RPROMPT='$(prompt_group "%*")'
PS2=' $(draw "%B${SUBCURSOR}%b") '

ZSH_THEME_GIT_PROMPT_PREFIX="%F{#6767ff}%Bgit:(%F{#ef0000}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f%b "
ZSH_THEME_GIT_PROMPT_DIRTY="%F{#6767ff}) %F{#efef00}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{#6767ff})"
