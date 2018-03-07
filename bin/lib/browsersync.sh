#!/bin/bash
# shellcheck disable=SC2154
# shellcheck disable=SC2086


function browsersyncReload() {
  log "🏁  BROWSERSYNC reload"
  ./node_modules/.bin/browser-sync \
    reload \
    --url http://${npm_package_config_url}:${npm_package_config_browsersync_port}
}

function browsersyncStart() {
  log "🎬  BROWSERSYNC start"
  ./node_modules/.bin/browser-sync \
    start \
    -c ./browsersync.json \
    --server ./serve \
    --port "${npm_package_config_browsersync_port}" \
    --ui-port "${npm_package_config_browsersync_uiport}"
}
