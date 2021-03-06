#!/bin/bash

_autil() {
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  dir="$( cd "$( dirname "$BASH_SOURCE" )" >/dev/null 2>&1 && pwd )"
  if [ "$prev" == "autil" ]; then
    script_dir="$dir/utils"
    COMPREPLY=($(ls $script_dir | grep "^$cur"))
  else
    # defer to completer script for name
    completer="${COMP_WORDS[1]}"
    COMPREPLY=($( \
      "$dir/completers/$completer" \
      $COMP_CWORD ${COMP_WORDS[@]} \
      2> /dev/null
    ))
  fi
}

complete -F _autil autil
