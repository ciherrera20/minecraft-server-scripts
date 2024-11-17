#!/bin/bash
set -euo pipefail

server_path=$HOME/servers/$1
if [ -f $server_path/server_pid ] && [ -d /proc/$(cat $server_path/server_pid) ]; then
	cat $server_path/stdout        # Print previous output
	tail -f $server_path/stdout &  # Print new output continuously in the background
	trap "kill $!" EXIT            # Kill tail on exit
	cat > $server_path/stdin       # Allows for giving the server commands
else
	echo $1 not running
	if [ -f $server_path/stdout ]; then
		echo last output was
		cat $server_path/stdout
		echo end of output
	else
		echo no server output
	fi
fi	
