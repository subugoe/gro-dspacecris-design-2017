#!/bin/bash

# shellcheck disable=SC1091
source ./bin/lib.sh

if [ -n "$1" ]; then
  BY="📦 $1"
fi

log "🏗 CSS Calc $BY"

./node_modules/.bin/postcss \
  ./assets/css/style.css \
  -m \
  -u postcss-calc \
  -o ./assets/css/style.css
