#!/bin/bash
set -euo pipefail

server_path=$HOME/servers/$1

if [ -f $server_path/server_pid ] && [ -d /proc/$(cat $server_path/server_pid) ]; then
	# echo say Server restart in 5 minutes > $server_path/stdin &
	# sleep 240
	echo say Server restart in 1 minute > $server_path/stdin &
	sleep 50
	echo say Server restart in 10s > $server_path/stdin &
	sleep 5
	echo say Server restart in 5s > $server_path/stdin &
	sleep 1
	echo say Server restart in 4s > $server_path/stdin &
	sleep 1
	echo say Server restart in 3s > $server_path/stdin &
	sleep 1
	echo say Server restart in 2s > $server_path/stdin &
	sleep 1
	echo say Server restart in 1s > $server_path/stdin &
	sleep 1
else
	echo $1 not running
fi
