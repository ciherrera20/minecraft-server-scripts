#!/bin/bash
set -euo pipefail

num_keep=$2
server_path=$HOME/servers/$1
src=proton:servers/$1

echo Retrieving backups for $1
backups="$(rclone lsf $src | sort)"  # Sort by date (earliest to latest)
num_backups=$(echo "$backups" | wc -l)


if [ $num_backups -gt $num_keep ]; then
	for backup in $(echo "$backups" | head -n $((num_backups - num_keep)))
	do
		echo Removing $1/$backup
		rclone -P deletefile proton:servers/$1/$backup
	done
else
	echo Keeping all $num_backups backups for $1
fi
