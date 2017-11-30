#!/bin/bash

# shellcheck disable=SC1091
source ./bin/lib.sh

if [ -n "$1" ]; then
  BY="📦 $1"
fi

log "😳 Jekyll Build [DEV] $BY"

./node_modules/.bin/nodemon \
  -e md,html,css,js \
  --watch jekyll \
  -x "./bin/jekyll-build--dev.sh; ./bin/browsersync-reload.sh;"
  # -x "./bin/jekyll-build--dev.sh; ./node_modules/.bin/browser-sync reload --url http://mockup-template.local;"
