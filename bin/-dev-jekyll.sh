#!/bin/bash

# shellcheck disable=SC1091
source ./bin/lib.sh

log "🎬  Dev jekyll"

./bin/cleanup-serve.sh
./bin/cleanup-css.sh

./node_modules/.bin/concurrently \
  --kill-others \
  --prefix "[{name}]" \
  --names "SCSS,COPY-CSS,JEKYLL,BROWSERSYNC" \
  "./bin/watch-scss--dev.sh" "./bin/watch-copy-css-to-jekyll-src.sh" "npm run watch-jekyll" "./bin/use-browsersync.sh"
