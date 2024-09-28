#!/bin/bash
set -euo pipefail

servers=$(ls -d $HOME/servers/* | sed -r "s/^([^\/]*\/)*([^\/]*)$/\2/")
for server in $servers
do
	get_server_status $server
done
