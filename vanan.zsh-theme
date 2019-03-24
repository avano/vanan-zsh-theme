GREEN="46"
WHITE="255"
YELLOW="190"
CYAN="45"
BLUE="26"
RED="196"
GRAY="240"

colorize() {
	echo "%F{$1}$2%f"
}

process_rebase() {
	if [ -d $(git rev-parse --git-dir)/rebase-merge ]; then
		CURRENT=$(cat `git rev-parse --git-dir`/rebase-merge/msgnum)
		TOTAL=$(cat `git rev-parse --git-dir`/rebase-merge/end)
		echo "($(colorize $RED R) $(colorize $CYAN "$CURRENT|$TOTAL)") "
	else
		CURRENT=$(cat `git rev-parse --git-dir`/rebase-apply/next)
		TOTAL=$(cat `git rev-parse --git-dir`/rebase-apply/last)
		echo "($(colorize $RED R) $(colorize $CYAN "$CURRENT|$TOTAL)") "
	fi
}

get_git_status() {
	# If not inside git dir, return empty string
	if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) != 'true' ]]; then
		return 1
	fi
	
	# If there is rebase file/directory
	if [ $(ls `git rev-parse --git-dir` | grep -c rebase) -ne 0 ]; then
		echo "$(process_rebase)"
	elif [ $(ls `git rev-parse --git-dir` | grep -c merge) -ne 0 ]; then
		echo "($(colorize $RED "M")$(colorize $CYAN ")") "
	file
	fi
}

last_status="%(?:$(colorize $GREEN ➤) :$(colorize $RED ➤) %s)"

my_git_prompt_status() {
	VAR=$(git_prompt_status)
	if [ -z "$VAR" ]; then
		echo ""
	else
		echo "$VAR "
	fi
}

PROMPT='$last_status %F{$WHITE}%3~%f $(git_prompt_info)$(get_git_status)$(my_git_prompt_status)%F{$WHITE}::%f '

ZSH_THEME_GIT_PROMPT_PREFIX="%F{$CYAN} "
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_ADDED="%F{$GREEN}✚%f "
ZSH_THEME_GIT_PROMPT_MODIFIED="%F{$YELLOW}⚑%f "
ZSH_THEME_GIT_PROMPT_DELETED="%F{$RED}✖%f "
ZSH_THEME_GIT_PROMPT_RENAMED="%F{$BLUE}▴%f "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{$GRAY}◒%f "
