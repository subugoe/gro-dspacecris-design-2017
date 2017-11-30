#!/bin/bash

# shellcheck disable=SC1091
source ./bin/lib.sh

log "😳 Watch-copy-css-to-jekyll-src-dest"

./node_modules/.bin/nodemon \
  -e css \
  --watch assets/css \
  -x "npm run copy-css-to-jekyll-src"
