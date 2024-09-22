#!/bin/bash
set -euo pipefail

if [ -f $1/server_pid ] && [ -d /proc/$(cat $1/server_pid) ]; then
	cat $1/stdout        # Print previous output
	tail -f $1/stdout &  # Print new output continuously in the background
	trap "kill $!" EXIT  # Kill tail on exit
	cat > $1/stdin       # Allows for giving the server commands
else
	echo $1 not running
fi	
