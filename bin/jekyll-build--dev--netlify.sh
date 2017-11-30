#!/bin/bash

# shellcheck disable=SC1091
source ./bin/lib.sh

if [ -n "$1" ]; then
  BY="📦 $1"
fi

log "🏗 Jekyll Build [DEV, NETLIFY] $BY"

bundle exec \
  jekyll build \
  --config jekyll_config_base.yml,jekyll_config_netlify.yml
