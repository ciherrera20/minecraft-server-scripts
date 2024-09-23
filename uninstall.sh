#!/bin/bash
set -euo pipefail

scripts=scripts/*.sh
for script in $scripts; do
	script_name=$(echo $script | sed -r "s/^([^\/]*\/)*([^\/]*)\.sh$/\2/")
	rm -f $HOME/bin/$script_name
done
