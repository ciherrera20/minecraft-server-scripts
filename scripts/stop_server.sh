#!/bin/bash
set -euo pipefail

server_path=$HOME/servers/$1
if [ -f $server_path/server_pid ] && [ -d /proc/$(cat $server_path/server_pid) ]; then
	echo stop > $server_path/stdin &
	rm -f $server_path/stdin
	rm -f $server_path/stdout
	rm -f $server_path/stderr
	rm -f $server_path/server_pid
else
	echo $1 not running 
fi
