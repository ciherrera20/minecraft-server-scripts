#!/bin/bash
set -euo pipefail

servers=$(ls -d $HOME/servers/* | sed -r "s/^([^\/]*\/)*([^\/]*)$/\2/")
for server in $servers
do
	echo Starting server $server
	start_server $server --silent
done
