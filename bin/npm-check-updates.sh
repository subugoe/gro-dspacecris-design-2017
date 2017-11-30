#!/bin/bash

# shellcheck disable=SC1091
source ./bin/lib.sh

log "🛠 NPM Check Updates"

./node_modules/.bin/ncu
