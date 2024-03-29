#!/bin/bash

_autil_index() {
  local _dir
  _dir="$(dirname "$BASH_SOURCE")"
  if ! alias autil 2> /dev/null; then
    alias autil="source \"$_dir/autil.sh\""
  fi
  source "$_dir/completer.sh"

}

_autil_index
unset _autil_index
