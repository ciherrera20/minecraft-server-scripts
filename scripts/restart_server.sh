#!/bin/bash
set -euo pipefail

stop_server $1
if [ -z ${2+x} ]; then
	start_server $1
else
	start_server $1 $2
fi
