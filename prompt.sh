_autil_prompt() {
  # consts
  local CYAN RED YELLOW PLAIN
  CYAN='\[\033[0;36m\]'
  RED='\[\033[0;31m\]'
  YELLOW='\[\033[0;33m\]'
  PLAIN='\[\033[0m\]'

  # config
  local DEFAULT_FORMAT TIME_FORMAT PATH_FORMAT
  DEFAULT_FORMAT='\[\033[1;37m\]'
  TIME_FORMAT='\[\033[1;37m\]'
  PATH_FORMAT='\[\033[;35m\]'

  # prompt parts
  local _date _pwd
  _date="[$(date +%H:%M)]"
  _pwd=`pwd`

  local user
  if [ ! -z "$SSH_TTY" ] || [ ! -z "$SSH_CLIENT" ]; then
    user="($USER@$(hostname))"
    # ssh, show user + system
  elif [ `logname` != "$USER" ]; then
    # su, show user only
    user="($USER)"
  fi

  local git is_git_repo
  is_git_repo=`git rev-parse --is-inside-work-tree 2>&1`
  if [ "$is_git_repo" = "true" ]; then
    local has_uncommitted_changes branch colour
    branch=`git rev-parse --abbrev-ref HEAD`
    has_uncommitted_changes=`git status --porcelain`
    colour="$CYAN"
    if [ ! -z "$has_uncommitted_changes" ]; then
      colour="$RED"
    else
      local has_unpushed_commits
      has_unpushed_commits=`git rev-list --left-only --count $branch...origin/$branch`
      if [ ! "$has_unpushed_commits" -eq "0" ]; then
        colour="$YELLOW"
      fi
    fi

    git="(${colour}${branch}${DEFAULT_FORMAT})"
  fi

  local virtual_env
  if [ ! -z $VIRTUAL_ENV ]; then
    virtual_env="(`basename \"$VIRTUAL_ENV\"`)"
  fi

  PS1="${DEFAULT_FORMAT}"

  PS1="$PS1${TIME_FORMAT}$_date${DEFAULT_FORMAT}"

  if [ ! -z $user ]; then
    PS1="$PS1 $user"
  fi

  if [ ! -z "$virtual_env" ]; then
    PS1="$PS1 $virtual_env"
  fi

  PS1="$PS1 ${PATH_FORMAT}${_pwd/$HOME/\~}${DEFAULT_FORMAT}"

  if [ ! -z "$git" ]; then
    PS1="$PS1 $git"
  fi

  PS1="$PS1 > ${PLAIN}"
}

export VIRTUAL_ENV_DISABLE_PROMPT=1
PROMPT_COMMAND=_autil_prompt

