#!/bin/bash

_autil() {
  COMPREPLY=()
  local cur prev dir
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  dir="$( cd "$( dirname "$BASH_SOURCE" )" >/dev/null 2>&1 && pwd )"
  if [ "$prev" == "autil" ]; then
    local script_dir
    script_dir="$dir/utils"
    COMPREPLY=($(ls $script_dir | grep "^$cur"))
  else
    # defer to completer script for name
    local completer
    completer="${COMP_WORDS[1]}"
    COMPREPLY=($( \
      "$dir/completers/$completer" \
      $COMP_CWORD ${COMP_WORDS[@]} \
      2> /dev/null
    ))
  fi
}

complete -F _autil autil
