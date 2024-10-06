#!/bin/bash
set -euo pipefail

servers=$(ls -d $HOME/servers/* | sed -r "s/^([^\/]*\/)*([^\/]*)$/\2/")
for server in $servers
do
	cull_server_backups $server $1 &
done
wait

echo Cleaning up remote
rclone -P cleanup proton:
