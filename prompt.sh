_autil_prompt() {
  CYAN='\033[0;36m'
  RED='\033[0;31m'
  YELLOW='\033[1;33m'
  PLAIN='\033[0m'

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

    git="${colour}(${branch})${PLAIN}"
  fi

  printf "${PLAIN}"

  printf "$_date ${_pwd/$HOME/\~}"
  if [ ! -z "$git" ]; then
    printf " $git"
  fi
  printf " > "
}

PS1='$(_autil_prompt)'

