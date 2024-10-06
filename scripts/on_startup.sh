#!/bin/bash
set -euo pipefail

start_all_servers
upload_all_backups
cull_all_backups 10
