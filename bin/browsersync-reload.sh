#!/bin/bash

# shellcheck disable=SC1091
source ./bin/lib.sh

if [ -n "$1" ]; then
  BY="📦 $1"
fi

log "🏃🏼‍ Browsersync Reload $BY"

./node_modules/.bin/browser-sync \
  reload \
  --url http://mockup-template.local
