GREEN="%{$fg_bold[green]%}"
WHITE="%{$fg_bold[white]%}"
YELLOW="%{$fg_bold[yellow]%}"
CYAN="%{$fg_bold[cyan]%}"
BLUE="%{$fg_bold[blue]%}"
RED="%{$fg_bold[red]%}"
MAGENTA="%{$fg_bold[magenta]%}"
GREY="%{$fg_bold[grey]%}"
RESET="%{$reset_color%}"

ret_status="%(?:$GREEN➤ :$RED➤ %s)"

my_git_prompt_status() {
	VAR=$(git_prompt_status)
	if [ -z "$VAR" ]; then
		echo ""
	else
		echo "$VAR "
	fi
}

PROMPT='$ret_status $BLUE%* $MAGENTA%~ $(git_prompt_info)$(my_git_prompt_status)$RESET'

ZSH_THEME_GIT_PROMPT_PREFIX="$CYAN "
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
ZSH_THEME_GIT_PROMPT_CLEAN=" $GREEN✔ "
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_ADDED="$GREEN✚ "
ZSH_THEME_GIT_PROMPT_MODIFIED="$YELLOW⚑ "
ZSH_THEME_GIT_PROMPT_DELETED="$RED✖ "
ZSH_THEME_GIT_PROMPT_RENAMED="$BLUE▴ "
ZSH_THEME_GIT_PROMPT_UNMERGED="$CYAN§ "
ZSH_THEME_GIT_PROMPT_UNTRACKED="$GREY◒ "
