#!/bin/bash

# shellcheck disable=SC1091
source ./bin/lib.sh

if [ -n "$1" ]; then
  BY="📦 $1"
fi

log "😳 CSS Watch [DEV] $BY"

./node_modules/.bin/nodemon \
  -e scss \
  --watch assets/scss \
  -x "./bin/css-compile-scss--dev.sh"
