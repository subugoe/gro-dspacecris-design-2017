#!/bin/bash
# shellcheck disable=SC1091

source ./.env
export MODE="development"
source ./bin/lib.sh

log "🎬  DEV start"

browsersyncStart & imgWatch & scssWatch & jekyllWatch
