#!/bin/bash
set -euo pipefail

cd $HOME/scripts
./announce_restart_all.sh
./stop_all_servers.sh
./backup_all_servers.sh
sudo shutdown -r 0
