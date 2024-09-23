#!/bin/bash
set -euo pipefail

servers=$(ls -d $HOME/servers/*) | sed -r "s/^([^\/]*\/)*([^\/]*)$/\2/"
for server in $servers
do
	echo Announcing restart to $server	
	announce_restart $server &
done
wait
