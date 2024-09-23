#!/bin/bash
set -euo pipefail

cd $HOME/scripts
./start_all_servers.sh
./upload_all_backups.sh
