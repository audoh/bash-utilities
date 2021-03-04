#!/bin/bash

_autil() {
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
  script_dir="$dir/utils"
  COMPREPLY=($(ls $script_dir | grep "^$cur"))
}

complete -F _autil autil
