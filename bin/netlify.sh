#!/bin/bash
# shellcheck disable=SC1091

source ./bin/lib.sh

log "🎬 Dist start"

imgBuild
scssBuildDist
jekyllBuildNetlify

log "🏁 Dist done"
