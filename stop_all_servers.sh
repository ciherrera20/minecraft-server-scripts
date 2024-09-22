#!/bin/bash
set -euo pipefail

servers=$(ls -d /home/mc/servers/*)
for server in $servers; do
	echo Stopping server $server
	./stop_server.sh $server
done
