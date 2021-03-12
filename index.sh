#!/bin/bash
_dir="$(dirname "$BASH_SOURCE")"
_autil_index() {
  local _dir
  _dir="$(dirname "$BASH_SOURCE")"
  if [ -z `which autil` ]; then
    alias autil='bash "$_dir/autil.sh"'
  fi
  source "$_dir/completer.sh"

}

_autil_index
unset _autil_index
