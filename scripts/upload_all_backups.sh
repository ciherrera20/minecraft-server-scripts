#!/bin/bash
set -euo pipefail

srcs=$(ls -d $HOME/servers/*/*.tar.gz)

for src in $srcs
do
	dst=proton:$(echo $src | grep -o servers/[^/]*)
	echo Copying $src tp $dst
	rclone -P move $src $dst
done
