#!/bin/bash
set -euo pipefail

mkdir -p $HOME/.local/bin
scripts=scripts/*.sh
for script in $scripts; do
	script_name=$(echo $script | sed -r "s/^([^\/]*\/)*([^\/]*)\.sh$/\2/")
	ln -s $(realpath $script) $HOME/.local/bin/$script_name
done
