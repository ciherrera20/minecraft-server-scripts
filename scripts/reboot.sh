#!/bin/bash
set -euo pipefail

announce_restart_all
stop_all_servers
backup_all_servers
sudo shutdown -r 0
