#!/bin/bash

# shellcheck disable=SC1091
source ./bin/lib.sh

if [ -n "$1" ]; then
  BY="📦 $1"
fi

log "🏗 CSS Nano $BY"

./node_modules/.bin/csso \
  "$(PWD)"/assets/css/style.css \
  "$(PWD)"/assets/css/style.css
