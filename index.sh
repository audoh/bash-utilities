#!/bin/bash
_dir="$(dirname "$BASH_SOURCE")"

if [ -z `which autil` ]; then
  alias autil='bash "$_dir/autil.sh"'
fi
source "$_dir/completer.sh"

unset _dir
