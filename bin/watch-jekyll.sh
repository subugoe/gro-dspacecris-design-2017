#!/bin/bash

# shellcheck disable=SC1091
source ./bin/lib.sh

if [ -n "$1" ]; then
  BY="📦 $1"
fi

log "😳 Jekyll watch $BY"

./bin/css-cleanup.sh
./bin/serve-cleanup.sh
./bin/css-compile-scss--prod.sh
./bin/css-copy-to-jekyll-src.sh

./node_modules/.bin/concurrently \
  --kill-others \
  -p "[{name}]" \
  -n "JEKYLL,BROWSERSYNC" \
  "./bin/jekyll--dev--watch.sh" "./bin/browsersync-use.sh"
