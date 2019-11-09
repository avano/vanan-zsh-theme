GREEN="%F{46}"
WHITE="%F{255}"
YELLOW="%F{190}"
CYAN="%F{45}"
BLUE="%F{26}"
RED="%F{196}"
GRAY="%F{240}"
NC="%f"

get_git_status() {
	# If not inside git dir, return empty string
	OUTPUT=""
	git rev-parse --is-inside-work-tree > /dev/null 2>&1 || return 1
	GIT_DIR=$(git rev-parse --git-dir)
	# If there is rebase file/directory
	if ls ${GIT_DIR} | grep -q "rebase" > /dev/null 2>&1; then
		if [ -d "${GIT_DIR}"/rebase-merge ]; then
			CURRENT="$(cat ${GIT_DIR}/rebase-merge/msgnum)"
			TOTAL="$(cat ${GIT_DIR}/rebase-merge/end)"
		else
			CURRENT=$(cat ${GIT_DIR}/rebase-apply/next)
			TOTAL=$(cat ${GIT_DIR}/rebase-apply/last)
		fi
		OUTPUT="${OUTPUT} (${RED}R${NC} ${CYAN}${CURRENT}|${TOTAL}) "
	fi

	echo "${OUTPUT} $(git_prompt_status)" | xargs
}

last_status="%(?:${GREEN}⏽${NC}:${RED}⏽${NC}%s)"

PROMPT='$last_status ${WHITE}%3~${NC}$(git_prompt_info)$(get_git_status) ${WHITE}::${NC} '

ZSH_THEME_GIT_PROMPT_PREFIX=" ${CYAN} "
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_ADDED="${GREEN}${NC} "
ZSH_THEME_GIT_PROMPT_MODIFIED="${YELLOW}${NC} "
ZSH_THEME_GIT_PROMPT_DELETED="${RED}${NC} "
ZSH_THEME_GIT_PROMPT_RENAMED="${BLUE}${NC} "
ZSH_THEME_GIT_PROMPT_UNTRACKED="${GRAY}${NC} "

# vim: filetype=sh
