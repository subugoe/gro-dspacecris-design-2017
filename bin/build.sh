#!/bin/bash
# shellcheck disable=SC1091

source ./.env
source ./bin/lib.sh

log "🎬  Build start"

imgBuild
scssBuild
jekyllBuild

log "🏁  Build done"
