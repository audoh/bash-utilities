#!/bin/bash
# Sources everything apart from package specific scripts like py.sh

_autil_bash() {
  local _dir
  _dir="$(dirname "$BASH_SOURCE")"

  source "$_dir/index.sh"
  source "$_dir/prompt.sh"
}

_autil_bash
unset _autil_bash
