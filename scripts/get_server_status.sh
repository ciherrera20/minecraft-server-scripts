#!/bin/bash
set -euo pipefail

server_path=$HOME/servers/$1

if [ -f $server_path/server_pid ] && [ -d /proc/$(cat $server_path/server_pid) ]; then
	echo $1 is running
else
	echo $1 not running
fi
