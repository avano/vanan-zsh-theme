# Path to your oh-my-zsh installation.
export ZSH=/home/avano/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="vanan"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

HISTSIZE=999999999
SAVEHIST=999999999


# If a completion is performed with the cursor within a word, and a full completion is inserted, the cursor is moved to the end of the word
setopt ALWAYS_TO_END

# If this is set, zsh sessions will append their history list to the history file, rather than replace it.
setopt APPEND_HISTORY

# Save each command's beginning timestamp (in seconds since the epoch) and the duration (in seconds) to the history file.
setopt EXTENDED_HISTORY

# Do not display duplicates of a line previously found, even if the duplicates are not contiguous.
setopt HIST_FIND_NO_DUPS

# Do not enter command lines into the history list if they are duplicates of the previous event
setopt HIST_IGNORE_DUPS

# When writing out the history file, older commands that duplicate newer ones are omitted
setopt HIST_SAVE_NO_DUPS

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git command-not-found mvn zsh-autosuggestions zsh-syntax-highlighting dirhistory)
# User configuration

typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[path]='none'
ZSH_HIGHLIGHT_STYLES[path_prefix]='none'
ZSH_HIGHLIGHT_STYLES[history-expansion]='none'
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# Source aliases and exports
source ~/.aliases

# Source functions
source ~/.funcs

# Path
source ~/.homes

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

keychain --quiet id_rsa

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
