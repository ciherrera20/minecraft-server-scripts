#!/bin/bash
set -euo pipefail

if [ -f $1/server_pid ] && [ -d /proc/$(cat $1/server_pid) ]; then
	echo $1 already running
else
	cd $1  # Move to server directory

	# Remove named pipes used to communicate to the server
	rm -f stdin
	rm -f stdout
	rm -f stderr
	rm -f server_pid

	# Create named pipes used to communicate to the server
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
	cd -  # Return to original directory

	# ./monitor_server.sh $1
fi
