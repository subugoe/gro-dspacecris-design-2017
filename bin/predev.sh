#!/bin/bash
# shellcheck disable=SC1091

source ./.env
MODE=development
source ./bin/lib.sh

logCleanup
serveCleanup
jekyllCleanup
imgCleanup
