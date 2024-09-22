#!/bin/bash
set -euo pipefail

if [ -f $1/server_pid ] && [ -d /proc/$(cat $1/server_pid) ]; then
	# echo say Server restart in 5 minutes > $1/stdin &
	# sleep 240
	echo say Server restart in 1 minute > $1/stdin &
	sleep 50
	echo say Server restart in 10s > $1/stdin &
	sleep 5
	echo say Server restart in 5s > $1/stdin &
	sleep 1
	echo say Server restart in 4s > $1/stdin &
	sleep 1
	echo say Server restart in 3s > $1/stdin &
	sleep 1
	echo say Server restart in 2s > $1/stdin &
	sleep 1
	echo say Server restart in 1s > $1/stdin &
	sleep 1
else
	echo $1 not running
fi
