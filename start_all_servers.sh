#!/bin/bash
set -euo pipefail

servers=$(ls -d /home/mc/servers/*)
for server in $servers
do
	echo Starting server $server
	./start_server.sh $server
done
