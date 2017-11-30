#!/bin/bash

# shellcheck disable=SC1091
source ./bin/lib.sh

if [ -n "$1" ]; then
  BY="📦 $1"
fi

./bin/log-cleanup.sh
log "🎬 Dist [DEV, NETLIFY] $BY"
./bin/css-cleanup.sh
./bin/serve-cleanup.sh
./bin/css-compile-scss--dev.sh
./bin/jekyll-build--dev--netlify.sh
log "🏁 Dist [DEV, NETLIFY] $BY"
