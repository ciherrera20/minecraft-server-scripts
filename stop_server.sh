#!/bin/bash
set -euo pipefail

if [ -f $1/server_pid ] && [ -d /proc/$(cat $1/server_pid) ]; then
	echo stop > $1/stdin &
else
	echo $1 not running 
fi
rm -f $1/stdin
rm -f $1/stdout
rm -f $1/stderr
rm -f $1/server_pid
