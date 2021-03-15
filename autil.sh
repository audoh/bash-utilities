#!/bin/bash

_autil_run() {
  local path=${BASH_SOURCE[0]}
  local file=`basename -- "$path"`
  local dir="$( cd "$( dirname "$path" )" >/dev/null 2>&1 && pwd )"
  local scriptdir="$dir/utils"
  local script="$1"
  shift

  if [ -z $script ]; then
    echo $file: script name required >&2
    exit 1
  fi

  handle_err() {
    local code=$1
    if [ $code -eq 127 ]; then
      echo valid commands: >&2
      ls $dir | grep .sh | while IFS= read -r line; do
        if [ $line == $file ]; then
          continue
        fi
        echo $line >&2
      done
      exit 1
    fi
  }

  trap 'handle_err $?' ERR
  source "$scriptdir/$script" "$@"
  trap - ERR

  unset handle_err
}

_autil_run $*
unset _autil_run
