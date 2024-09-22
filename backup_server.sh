#!/bin/bash
set -euo pipefail

# Archive and compress the server's world
tar -czvf $1/world_$(date '+%d-%m-%Y_%H:%M:%S').tar.gz $1/world &
trap "kill $!" EXIT
wait
