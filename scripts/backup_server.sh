#!/bin/bash
set -euo pipefail

# Archive and compress the server's world
server_path=$HOME/servers/$1
tar -czvf $server_path/world_$(date '+%d-%m-%Y_%H:%M:%S').tar.gz $server_path/world &
trap "kill $!" EXIT
wait
