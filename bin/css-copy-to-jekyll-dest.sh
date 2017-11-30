#!/bin/bash

# shellcheck disable=SC1091
source ./bin/lib.sh

if [ -n "$1" ]; then
  BY="📦 $1"
fi

log "🚌 CSS Copy to Jekyll DEST $BY"

cp ./assets/css/style.css ./serve/assets/css/style.css
cp ./assets/css/style.css.map ./serve/assets/css/style.css.map
