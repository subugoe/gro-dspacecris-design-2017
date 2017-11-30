#!/bin/bash

# shellcheck disable=SC1091
source ./bin/lib.sh

log "😳 Watch-copy-css-to-jekyll-src"

./node_modules/.bin/nodemon \
  -e css \
  --watch assets/css \
  -x "./bin/css-copy-to-jekyll-src.sh"
