#!/bin/bash
set -euo pipefail

servers=$(ls -d /home/mc/servers/*)
for server in $servers
do
	echo Backing up $server	
	./backup_server.sh $server &
done
wait
