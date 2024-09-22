#!/bin/bash
set -euo pipefail

servers=$(ls -d /home/mc/servers/*)
for server in $servers
do
	echo Announcing restart to $server	
	./announce_restart.sh $server &
done
wait
