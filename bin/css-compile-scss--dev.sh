#!/bin/bash

# shellcheck disable=SC1091
source ./bin/lib.sh

if [ -n "$1" ]; then
  BY="📦 $1"
fi

# not using node-sass <input> <output> here because --source-map-embed needs -o
./node_modules/.bin/node-sass \
  ./assets/scss/style.scss \
  --output-style expanded \
  --source-map true \
  -o ./assets/css/

FILENAME=./assets/css/style.css

if [ -f "$FILENAME" ]; then
  log "🏗 Scss Compile [DEV] $BY"

  ./bin/css-prefix.sh
  ./bin/css-font-values.sh
  ./bin/css-objectfit.sh
  ./bin/css-copy-to-jekyll-src.sh
  # log "🚌 CSS Copy to Jekyll SRC $BY"
  #
  # cp "$(PWD)"/assets/css/style.css "$(PWD)"/jekyll/assets/css/style.css
  # cp "$(PWD)"/assets/css/style.css.map "$(PWD)"/jekyll/assets/css/style.css.map
else
  log "❌ Scss Compile [DEV] failed $BY"
fi
