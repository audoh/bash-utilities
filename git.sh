#!/bin/bash
_autil_git() {
  local _dir
  _dir="$(dirname "$BASH_SOURCE")"
  export PATH="$_dir/git:$PATH"
}

_autil_git
unset _autil_git
