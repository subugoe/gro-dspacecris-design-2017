#!/bin/bash

# shellcheck disable=SC1091
source ./bin/lib.sh

log "😳 watch-build-css--dev-for-jekyll"

./node_modules/.bin/nodemon \
  -e scss \
  --watch assets/scss \
  -x "./bin/build-css--dev-for-jekyll.sh"
