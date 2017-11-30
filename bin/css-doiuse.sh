#!/bin/bash

# shellcheck disable=SC1091
source ./bin/lib.sh

log "🏗 CSS Doiuse"

./node_modules/.bin/doiuse \
  ./jekyll/assets/css/style.css
