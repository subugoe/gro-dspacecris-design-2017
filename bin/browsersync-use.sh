#!/bin/bash

# shellcheck disable=SC1091
source ./bin/lib.sh

if [ -n "$1" ]; then
  BY="📦 $1"
fi

log "🏃🏼‍ Browsersync $BY"

./node_modules/.bin/browser-sync \
  start \
  -c ./browsersync.json
