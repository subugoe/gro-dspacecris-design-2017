#!/bin/bash

# shellcheck disable=SC1091
source ./bin/lib.sh

if [ -n "$1" ]; then
  BY="📦 $1"
fi

log "🚌 CSS Copy to Jekyll DEST $BY"

cp "$(PWD)"/assets/css/style.css "$(PWD)"/serve/assets/css/style.css
cp "$(PWD)"/assets/css/style.css.map "$(PWD)"/serve/assets/css/style.css.map
