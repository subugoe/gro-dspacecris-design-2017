#!/bin/bash
# shellcheck disable=SC2154
# shellcheck disable=SC2086

function jekyllBuildDist() {
  log "🏗️  JEKYLL build [DIST]"
  bundle exec \
    jekyll build \
    --config jekyll_config_base.yml,jekyll_config_dist.yml
}

function jekyllBuildNetlify() {
  log "🏗️  JEKYLL build [NETLIFY]"
  bundle exec \
    jekyll build \
    --config jekyll_config_base.yml,jekyll_config_netlify.yml
}

function jekyllBuildDev() {
  log "🏗️  JEKYLL build [DEV]"
  bundle exec \
    jekyll build \
    --config jekyll_config_base.yml
}

function jekyllCleanup() {
  log "🗑️  JEKYLL Clean-Up"
  rm -r ./jekyll/assets/img/*
  rm -r ./jekyll/assets/css/*
}

function jekyllWatchDev() {
  log "😳  JEKYLL watch"
  ./node_modules/.bin/nodemon \
    -e md,html,css,js,png,jpg,jpeg,svg \
    --watch jekyll \
    -x "./bin/jekyll-build--dev.sh; ./bin/browsersync-reload.sh;"
}
