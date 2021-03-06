#!/bin/bash
# Sources everything apart from package specific scripts like py.sh
_dir="$(dirname "$BASH_SOURCE")"
source "$_dir/index.sh"
source "$_dir/prompt.sh"
