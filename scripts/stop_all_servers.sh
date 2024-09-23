#!/bin/bash
set -euo pipefail

servers=$(ls -d $HOME/servers/* | sed -r "s/^([^\/]*\/)*([^\/]*)$/\2/")
for server in $servers; do
	echo Stopping server $server
	stop_server $server
done
