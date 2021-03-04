#!/bin/bash

_autil() {
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
  COMPREPLY=($(ls $dir | grep .sh$ | sed 's/.sh$//g' | grep "^$cur"))
}

complete -F _autil autil
#autocomplete $1
