#!/bin/bash
set -euo pipefail

cd /home/mc/scripts
./start_all_servers.sh
./upload_all_backups.sh
