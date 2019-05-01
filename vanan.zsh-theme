GREEN="%F{46}"
WHITE="%F{255}"
YELLOW="%F{190}"
CYAN="%F{45}"
BLUE="%F{26}"
RED="%F{196}"
GRAY="%F{240}"
NC="%f"

colorize() {
	echo "%F{$1}$2%f"
}

process_rebase() {
	if [ -d "$(git rev-parse --git-dir)"/rebase-merge ]; then
		CURRENT="$(<$(git rev-parse --git-dir)/rebase-merge/msgnum)"
		TOTAL="$(<$(git rev-parse --git-dir)/rebase-merge/end)"
	else
		CURRENT=$(<$(git rev-parse --git-dir)/rebase-apply/next)
		TOTAL=$(<$(git rev-parse --git-dir)/rebase-apply/last)
	fi
	echo "(${RED}R${NC} ${CYAN}${CURRENT}|${TOTAL}) "
}

get_git_status() {
	# If not inside git dir, return empty string
	git rev-parse --is-inside-work-tree > /dev/null 2>&1 || return 1
	# If there is rebase file/directory
	if $(ls "$(git rev-parse --git-dir)" | grep -q rebase); then
		echo "$(process_rebase)"
	elif $(ls "$(git rev-parse --git-dir)" | grep -q merge); then
		echo "(${RED}M${NC}) "
	fi
}

last_status="%(?:${GREEN}➤${NC} :${RED}➤${NC} %s)"

my_git_prompt_status() {
	VAR=$(git_prompt_status)

	if [ -z "${VAR}" ]; then
		echo ""
	else
		echo "${VAR} "
	fi
}

PROMPT='$last_status ${WHITE}%3~${NC} $(git_prompt_info)$(get_git_status)$(my_git_prompt_status)${WHITE}::${NC} '

ZSH_THEME_GIT_PROMPT_PREFIX="${CYAN} "
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_ADDED="${GREEN}✚${NC} "
ZSH_THEME_GIT_PROMPT_MODIFIED="${YELLOW}⚑${NC} "
ZSH_THEME_GIT_PROMPT_DELETED="${RED}✖${NC} "
ZSH_THEME_GIT_PROMPT_RENAMED="${BLUE}▴${NC} "
ZSH_THEME_GIT_PROMPT_UNTRACKED="${GRAY}❓${NC} "

# vim: filetype=sh
