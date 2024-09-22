#!/bin/bash
set -euo pipefail

./stop_server.sh $1
./start_server.sh $1
