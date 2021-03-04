_dir="$(dirname "$BASH_SOURCE")"
alias autil='bash "$_dir/autil.sh"'
for f in $_dir/completers/*; do source $f; done
