#!/bin/bash
set -euo pipefail

srcs=$(ls -d /home/mc/servers/*/*.tar.gz)

for src in $srcs
do
	dst=proton:$(echo $src | grep -o servers/[^/]*)
	rclone -P move $src $dst
done
