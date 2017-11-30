#!/bin/bash

# shellcheck disable=SC1091
source ./bin/lib.sh

if [ -n "$1" ]; then
  BY="📦 $1"
fi

log "🏗 Scss Compile [PROD] $BY"

./node_modules/.bin/node-sass \
  ./assets/scss/style.scss \
  --output-style expanded \
  --source-map true \
  -o ./assets/css/

./bin/css-prefix.sh
./bin/css-font-values.sh
./bin/css-nano.sh
