#!/bin/bash
_autil_everything() {
  local _dir
  _dir="$(dirname "$BASH_SOURCE")"
  source "$_dir/bash.sh"
  source "$_dir/py.sh"
  source "$_dir/git.sh"
  source "$_dir/copy.sh"
}

_autil_everything
unset _autil_everything
