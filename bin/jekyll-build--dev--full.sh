#!/bin/bash

# shellcheck disable=SC1091
source ./bin/lib.sh

SCRIPTNAME="Jekyll Build [DEV, FULL]"

if [ -n "$1" ]; then
  BY="📦 $1"
fi

log "🎬 Jekyll Build [DEV, FULL] $BY"

./bin/css-build--dev.sh "$SCRIPTNAME"
./bin/css-copy-to-jekyll-src.sh "$SCRIPTNAME"
./bin/css-copy-to-jekyll-dest.sh "$SCRIPTNAME"
./bin/jekyll-build--dev.sh "$SCRIPTNAME"

log "🏁 Jekyll Build [DEV, FULL] $BY"
