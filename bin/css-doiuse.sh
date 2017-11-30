#!/bin/bash

# shellcheck disable=SC1091
source ./bin/lib.sh

log "🏗 CSS Doiuse"

./node_modules/.bin/doiuse \
  "$(PWD)"/jekyll/assets/css/style.css
