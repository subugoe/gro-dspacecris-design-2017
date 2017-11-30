#!/bin/bash

# shellcheck disable=SC1091
source ./bin/lib.sh

SCRIPTNAME="CSS Build [DEV]"

if [ -n "$1" ]; then
  BY="📦 $1"
fi

log "🎬 CSS Build [DEV] $BY"

./bin/css-compile-scss--dev.sh "$SCRIPTNAME"
./bin/css-prefix.sh "$SCRIPTNAME"
./bin/css-calc.sh "$SCRIPTNAME"
./bin/css-font-values.sh "$SCRIPTNAME"

log "🏁 CSS build [DEV] $BY"
