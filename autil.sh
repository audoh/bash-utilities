#!/bin/bash

path=${BASH_SOURCE[0]}
file=`basename -- "$path"`
dir="$( cd "$( dirname "$path" )" >/dev/null 2>&1 && pwd )"
scriptdir="$dir/utils"
script="$1"
shift

if [ -z $script ]; then
  echo $file: script name required >&2
  exit 1
fi

handle_err() {
  code=$1
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
"$scriptdir/$script" "$@"
trap - ERR
