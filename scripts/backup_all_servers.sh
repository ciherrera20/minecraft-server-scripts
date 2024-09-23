#!/bin/bash
set -euo pipefail

servers=$(ls -d $HOME/servers/* | sed -r "s/^([^\/]*\/)*([^\/]*)$/\2/")
for server in $servers
do
	echo Backing up $server	
	backup_server $server &
done
wait
