#!/bin/bash

# shellcheck disable=SC1091
source ./bin/lib.sh

if [ -n "$1" ]; then
  BY="📦 $1"
fi

log "🗑 CSS $BY"

rm -r ./assets/css/*
rm -r ./jekyll/assets/css/*
rm -r ./serve/assets/css/*
