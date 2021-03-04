#!/bin/bash

_autil() {
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  if [ "$prev" == "autil" ]; then
    dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
    script_dir="$dir/../utils"
    COMPREPLY=($(ls $script_dir | grep "^$cur"))
  fi
}

complete -F _autil autil
