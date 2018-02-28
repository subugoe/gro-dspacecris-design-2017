#!/bin/bash
# shellcheck disable=SC1091

source ./bin/lib.sh

log "🎬  Dist start"

imgBuild
scssBuildDist
jekyllBuildDist

log "🏁  Dist done"
