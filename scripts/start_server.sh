#!/bin/bash
set -euo pipefail

server_path=$HOME/servers/$1
if [ -f $server_path/server_pid ] && [ -d /proc/$(cat $server_path/server_pid) ]; then
	echo $1 already running
else
	cd $server_path >/dev/null  # Move to server directory

	# Remove files used to communicate with the server
	rm -f stdin
	rm -f stdout
	rm -f stderr
	rm -f server_pid

	# Create files used to communicate with the server
	mkfifo stdin
	touch stdout
	touch stderr
	touch server_pid

	{
		# Open pipes in read-write mode. The java process inherits this, preventing it from blocking when it tries to open the pipes
		exec 3<>stdin
		java $(cat flags) -jar server.jar --nogui <stdin >stdout 2>stderr &
		echo $! > server_pid
	}
	cd - >/dev/null # Return to original directory

	if [ -z ${2+x} ]; then
		monitor_server $1
	fi
fi
