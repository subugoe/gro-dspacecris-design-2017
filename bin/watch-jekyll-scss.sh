#!/bin/bash

# shellcheck disable=SC1091
source ./bin/lib.sh

if [ -n "$1" ]; then
  BY="📦 $1"
fi

log "😳 Jekyll (incl. Scss) watch $BY"

./bin/css-cleanup.sh
./bin/serve-cleanup.sh

# ./node_modules/.bin/concurrently \
#   --kill-others \
#   -p "[{name}]" \
#   -n "SCSS,JEKYLL,BROWSERSYNC" \
#   -c "bgBlue.bold,bgMagenta.bold,bgYellow.bold" \
#     "./bin/css-compile-scss--dev--watch.sh" \
#     "./bin/jekyll--dev--watch.sh" \
#     "./bin/browsersync-use.sh"

# ./bin/browsersync-use.sh &>/dev/null & \
./bin/browsersync-use.sh & \
./node_modules/.bin/concurrently \
  --kill-others \
  -p "[{name}]" \
  -n "SCSS,JEKYLL" \
  -c "bgBlue.bold,bgMagenta.bold" \
    "./bin/css-compile-scss--dev--watch.sh" \
    "./bin/jekyll--dev--watch.sh"
