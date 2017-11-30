#!/bin/bash

# shellcheck disable=SC1091
source ./bin/lib.sh

if [ -n "$1" ]; then
  BY="📦 $1"
fi

log "🚌 CSS Copy to Jekyll SRC $BY"
mkdir ./jekyll/assets/css
cp ./assets/css/style.css ./jekyll/assets/css/style.css
cp ./assets/css/style.css.map ./jekyll/assets/css/style.css.map
