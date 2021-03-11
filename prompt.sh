_autil_prompt() {
  CYAN='\033[0;36m'
  RED='\033[0;31m'
  YELLOW='\033[0;33m'
  PLAIN='\033[0m'

  DEFAULT_FORMAT='\033[0;30m'
  TIME_FORMAT='\033[0;29m'
  PATH_FORMAT='\033[01;34m'

  _date="[$(date +%H:%M)]"
  _pwd=`pwd`

  is_git_repo=`git rev-parse --is-inside-work-tree 2>&1`
  if [ "$is_git_repo" = "true" ]; then
    branch=`git rev-parse --abbrev-ref HEAD`
    has_uncommitted_changes=`git status --porcelain`
    colour="$CYAN"
    if [ ! -z "$has_uncommitted_changes" ]; then
      colour="$RED"
    else
      has_unpushed_commits=`git rev-list --left-only --count $branch...origin/$branch`
      if [ ! "$has_unpushed_commits" -eq "0" ]; then
        colour="$YELLOW"
      fi
    fi

    git="(${colour}${branch}${DEFAULT_FORMAT})"
  fi

  printf "${DEFAULT_FORMAT}"

  printf "${TIME_FORMAT}$_date${DEFAULT_FORMAT}"
  printf " ${PATH_FORMAT}${_pwd/$HOME/\~}${DEFAULT_FORMAT}"
  if [ ! -z "$git" ]; then
    printf " $git"
  fi
  printf " > ${PLAIN}"
}

PS1='$(_autil_prompt)'

