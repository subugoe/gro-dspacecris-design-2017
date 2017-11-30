#!/bin/bash

# shellcheck disable=SC1091
source ./bin/lib.sh

log "🎬  Dev jekyll"

./bin/cleanup-serve.sh
./bin/cleanup-css.sh

./bin/build-jekyll--dev.sh
./bin/build-css--dev-for-jekyll.sh

./node_modules/.bin/concurrently \
  --kill-others \
  --prefix "[{name}]" \
  --names "SCSS,BROWSERSYNC" \
  "./bin/watch-build-css--dev-for-jekyll.sh" "./bin/use-browsersync.sh"
